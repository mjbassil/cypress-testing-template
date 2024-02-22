Feature: Get limited products

    Scenario Outline: Nominal case
        When I send a "GET" request to "get limited products"
        Then The response code is 200
        And I save the response into the file "limited_products.json"
        And The json file "limited_products.json" is equal to the expected json file "expected_limited_products.json"
