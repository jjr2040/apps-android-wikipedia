Feature: Search in list feature
  @searchlist
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text animal
    And I wait for progress
    And I press "search_results_list"
    And I wait for progress
    And take picture
    And I press "article_menu_bookmark"
    And take picture
    And I press "Got it"
    And take picture
    And I press "Create new"
    And take picture
    And I keyboard enter text listname
    And take picture
    And I press "OK"
    And take picture
    And I press "More options"
    And take picture
    And I press "My lists"
    And take picture
    And I press "No thanks"
    And take picture
    And I press "menu_search_lists"
    And take picture
    And I keyboard enter text listname
    And take picture
    Then I should see "1 article, "