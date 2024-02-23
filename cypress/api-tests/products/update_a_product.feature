Feature: Update a products

    Scenario Outline: Nominal case
        When I send a "PUT" request to "update a product"
            | no dataTable |
        Then The response code is 200