Feature: Add a products

    Scenario Outline: Nominal case
        When I send a "POST" request to "add a product"
            | no dataTable |
        Then The response code is 200
