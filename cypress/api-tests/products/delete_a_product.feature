Feature: Delete a products

    Scenario Outline: Nominal case
        When I send a "DELETE" request to "delete a product"
            | no dataTable |
        Then The response code is 200