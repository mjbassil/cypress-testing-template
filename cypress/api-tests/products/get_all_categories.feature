Feature: Get all categories

    Scenario Outline: Nominal case
        When I send a "GET" request to "get all categories"
            | no dataTable |
        Then The response code is 200
        And I save the response into the file "all_categories.json"
        And The json file "all_categories.json" is equal to the expected json file "expected_all_categories.json"
