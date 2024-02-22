Feature: Update a products

    Scenario Outline: Nominal case
        When I send a "PUT" request to "update a product"
        Then The response code is 200