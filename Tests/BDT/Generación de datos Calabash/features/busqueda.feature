Feature: Search feature
  @search
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text animal
    And I wait for progress
    And I press "search_results_list"
    And I wait for progress
    And I press "article_menu_show_toc"
    And I scroll down
    Then I should see text containing "References"