Feature: Search word feature
  @searchw
  Scenario: As a valid user I can search words in the article
    When I press "fragment_onboarding_skip_button"
    And take picture
    And I press "Search Wikipedia"
    And take picture
    And I keyboard enter text "Female education"
    And take picture
    And I wait for progress
    And take picture
    And I press "search_results_list"
    And take picture
    And I wait for progress
    And take picture
    And I press "article_menu_find_in_page"
    And take picture
    And I keyboard enter text gender
    And take picture
    Then I should see "1/"