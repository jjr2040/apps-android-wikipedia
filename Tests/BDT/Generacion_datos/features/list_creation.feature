Feature: Save list feature
  @listname
  Scenario: As a valid user I can search words in the article
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text "Female education"
    And take picture
    And I wait for progress
    And take picture
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
    Then I should see "Added to"