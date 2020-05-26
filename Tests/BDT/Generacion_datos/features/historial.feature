Feature: Search in list feature
  @searchlist
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And take picture
    And I keyboard enter text listname
    And take picture
    And I wait for progress
    And I press "search_results_list"
    And take picture
    And I wait for progress
    And take picture
    And I press "More options"
    And take picture
    And I press "History"
    And take picture
    And I press "menu_search_history"
    And take picture
    And I keyboard enter text listname
    And take picture
    Then I should see "2020"