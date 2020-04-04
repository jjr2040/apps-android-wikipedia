Feature: Register feature
  @login
  Scenario: As a valid user I can register into my app
    When I press "fragment_onboarding_skip_button"
    And I press "My lists"
    And I press "view_onboarding_action_positive"
    And I press "Join Wikipedia"
    And I press "create_account_username"
    And I keyboard enter text username
    And I scroll down
    And I press "create_account_password_input"
    And I keyboard enter text password
    And I scroll down
    And I press "create_account_password_repeat"
    And I keyboard enter text password
    And I press "Next"
    And I press "button1"
    Then I should see "To help protect"
