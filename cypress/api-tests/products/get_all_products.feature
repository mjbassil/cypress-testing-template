Feature: Get all products

    Scenario Outline: Nominal case
        When I send a "GET" request to "get all products"
            | no dataTable |
        Then The response code is 200
        And I save the response into the file "all_products.json"
        And The json file "all_products.json" is equal to the expected json file "expected_all_products.json"
