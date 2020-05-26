Feature: Register feature
  @login
  Scenario: As a valid user I can register into my app
    When I press "fragment_onboarding_skip_button"
    And I press "My lists"
    And take picture
    And I press "view_onboarding_action_positive"
    And take picture
    And I press "Join Wikipedia"
    And take picture
    And I press "create_account_username"
    And take picture
    And I keyboard enter text username
    And take picture
    And I scroll down
    And take picture
    And I press "create_account_password_input"
    And I keyboard enter text password
    And I scroll down
    And I press "create_account_password_repeat"
    And I keyboard enter text password
    And take picture
    And I press "Next"
    And take picture
    And I press "button1"
    And take picture
    Then I should see "To help protect"
