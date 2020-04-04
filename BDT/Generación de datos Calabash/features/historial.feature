Feature: Search in list feature
  @searchlist
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text listname
    And I wait for progress
    And I press "search_results_list"
    And I wait for progress
    And I press "More options"
    And I press "History"
    And I press "menu_search_history"
    And I keyboard enter text listname
    Then I should see "2020"