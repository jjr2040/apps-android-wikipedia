Feature: Search word feature
  @searchw
  Scenario: As a valid user I can search words in the article
    When I press "fragment_onboarding_skip_button"
    And I press "Search Wikipedia"
    And I keyboard enter text "Female education"
    And I wait for progress
    And I press "search_results_list"
    And I wait for progress
    And I press "article_menu_find_in_page"
    And I keyboard enter text gender
    Then I should see "1/"