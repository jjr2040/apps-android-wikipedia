Feature: Change language feature
  @language
  Scenario: As a valid user I can change the language in my app
    When I press "Add or edit languages"
    And I press "Add language"
    And I press "Español"
    And I wait for progress
    And I press "Español"
    And I press "More options"
    And I press "Remove language"
    And I press "English"
    And I press "menu_delete_selected"
    And I press "OK"
    And I wait for progress
    And I press "Add language"
    And I press "menu_search_language"
    And I keyboard enter text language
    And I wait for progress
    Then I press "language_subtitle"