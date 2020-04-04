Feature: Login_incorrect feature
  @login
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
    And I press "My lists"
    And I press "view_onboarding_action_positive"
    And I press "login_username_text"
    And I keyboard enter text username
    And I press "login_password_input"
    And I keyboard enter text password
    And I press "Log in"
    Then I should see "Incorrect username"
