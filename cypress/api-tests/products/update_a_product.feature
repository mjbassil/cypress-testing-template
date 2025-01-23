Feature: Update a products

    Scenario Outline: Nominal case
        When I send a "PUT" request to "update a product"
            | parameter   | value                 |
            | productId   | 7                     |
            | title       | test product          |
            | price       | 15                    |
            | description | lorem ipsum set       |
            | image       | https://i.pravatar.cc |
            | category    | jewelry   m           |
        Then The response code is 200
        And I save the response into the file "updated_product.json"
        And The json file "updated_product.json" is equal to the expected json file "expected_updated_product.json"