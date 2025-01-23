Feature: Add a products

    Scenario Outline: Nominal case
        When I send a "POST" request to "add a product" with a body
            | parameter   | value                 |
            | title       | test product          |
            | price       | 20                    |
            | description | lorem ipsum set       |
            | image       | https://i.pravatar.cc |
            | category    | electronic            |
        Then The response code is 200
        And I save the response into the file "added_product.json"
        And The json file "added_product.json" is equal to the expected json file "expected_added_product.json"
