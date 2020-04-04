Feature: Save list feature
  @listname
  Scenario: As a valid user I can search words in the article
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text "Female education"
    And I wait for progress
    And I press "search_results_list"
    And I wait for progress
    And I press "article_menu_bookmark"
    And I press "Got it"
    And I press "Create new"
    And I keyboard enter text listname
    And I press "OK"
    Then I should see "Added to"