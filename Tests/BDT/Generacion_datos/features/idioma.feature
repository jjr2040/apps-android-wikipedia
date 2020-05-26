Feature: Change language feature
  @language
  Scenario: As a valid user I can change the language in my app
    When I press "Add or edit languages"
    And take picture
    And I press "Add language"
    And take picture
    And I press "Español"
    And I wait for progress
    And I press "Español"
    And take picture
    And I press "More options"
    And take picture
    And I press "Remove language"
    And take picture
    And I press "English"
    And take picture
    And I press "menu_delete_selected"
    And take picture
    And I press "OK"
    And I wait for progress
    And take picture
    And I press "Add language"
    And take picture
    And I press "menu_search_language"
    And take picture
    And I keyboard enter text language
    And take picture
    And I wait for progress
    And take picture
    Then I press "language_subtitle"