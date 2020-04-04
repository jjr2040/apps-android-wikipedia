Feature: Search in list feature
  @searchlist
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text animal
    And I wait for progress
    And I press "search_results_list"
    And I wait for progress
    And I press "article_menu_bookmark"
    And I press "Got it"
    And I press "Create new"
    And I keyboard enter text listname
    And I press "OK"
    And I press "More options"
    And I press "My lists"
    And I press "No thanks"
    And I press "menu_search_lists"
    And I keyboard enter text listname
    Then I should see "1 article, "