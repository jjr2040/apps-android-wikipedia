Feature: Txt description add feature
  @description
  Scenario: As a valid user I can log into my app
    When I press "fragment_onboarding_skip_button"
        And I press "My lists"
        And I press "view_onboarding_action_positive"
        And I press "login_username_text"
        And I keyboard enter text "Bobespin"
        And I press "login_password_input"
        And I keyboard enter text "bobespinmarley"
        And I press "Log in"
        And I wait for progress
        And I press "Suggested edits"
        And I wait for progress
        And I press "Article descriptions"
        And I wait for progress
        And I press "action_bar"
        And I wait for progress
        And I press "Add description"
        And I keyboard enter text loremipsum
        And I press "view_description_edit_save_button"
        And I wait for progress
        And I press "view_description_edit_save_button"
        Then I should see "Article description published"