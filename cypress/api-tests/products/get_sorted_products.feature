Feature: Get sorted products

    Scenario Outline: Nominal case
        When I send a "GET" request to "get sorted products"
            | parameter | value |
            | sort      | desc  |
        Then The response code is 200
        And I save the response into the file "sorted_products.json"
        And The json file "sorted_products.json" is equal to the expected json file "expected_sorted_products.json"
