Feature: Get all products from category

    Scenario Outline: Nominal case
        When I send a "GET" request to "get all product from a category"
            | no dataTable |
        Then The response code is 200
        And I save the response into the file "products_of_category.json"
        And The json file "products_of_category.json" is equal to the expected json file "expected_products_of_category.json"
