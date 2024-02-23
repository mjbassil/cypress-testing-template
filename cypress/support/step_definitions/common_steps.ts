import { When, Then } from "@badeball/cypress-cucumber-preprocessor"
const _ = require("lodash");

When("I send a {string} request to {string}", function (method: any, route: any, dataTable: any) {
    cy.fixture("requests.json").then((requests) => {
        var url = requests[route];
        if (dataTable != null) {
            dataTable.hashes().forEach(element => {
                url = url.replace(`[${element.parameter}]`, element.value);
            })
            cy.request({
                method: method,
                url: Cypress.env("baseUrl") + url,
                failOnStatusCode: false
            }).as("request");
        }

    });
});

Then("The response code is {int}", function (statusCode) {
    cy.get("@request").then((response) => {
        expect(response['status']).to.eq(statusCode)
    })
});

Then("I save the response into the file {string}", function (fileName) {
    cy.get("@request").then((response) => {
        cy.writeFile("cypress/fixtures/responses/" + fileName, response["body"])
    })
});

Then("The json file {string} is equal to the expected json file {string}", function (responseFile, expectedResponseFile) {
    var actualResponse, expectedResponse;
    cy.fixture("responses/" + responseFile).then((responseBody) => {
        actualResponse = responseBody;

        cy.fixture("expected_responses/" + expectedResponseFile).then((expectedResponsebody) => {
            expectedResponse = expectedResponsebody;
            if(!_.isEqual(actualResponse, expectedResponse)){
                expect(JSON.stringify(actualResponse)).to.eq(JSON.stringify(expectedResponse))
            }
            expect(_.isEqual(actualResponse, expectedResponse)).to.be.true;
        })
    })

});