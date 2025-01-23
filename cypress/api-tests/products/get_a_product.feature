Feature: Get a products

    Scenario Outline: Nominal case
        When I send a "GET" request to "get a product"
            | parameter | value |
            | productId | 3     |
        Then The response code is 200
        And I save the response into the file "one_product.json"
        And The json file "one_product.json" is equal to the expected json file "expected_one_product.json"
