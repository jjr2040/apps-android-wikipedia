require 'calabash-android/calabash_steps'
Then /^I keyboard enter text "(.*)"$/ do 
    |todo_a| keyboard_enter_text todo_a end


Then /^I keyboard enter text username$/ do 
    keyboard_enter_text JSON.parse($account_details)['username'] end

Then /^I keyboard enter text password$/ do 
    keyboard_enter_text JSON.parse($account_details)['password'] end

Then /^I keyboard enter text animal$/ do 
    keyboard_enter_text JSON.parse($account_details)['animal'] end

Then /^I keyboard enter text language$/ do 
    keyboard_enter_text JSON.parse($account_details)['language'] end

Then /^I keyboard enter text gender$/ do 
    keyboard_enter_text JSON.parse($account_details)['gender'] end

Then /^I keyboard enter text listname$/ do 
    keyboard_enter_text JSON.parse($account_details)['listname'] end  

Then /^I keyboard enter text loremipsum$/ do  
    keyboard_enter_text JSON.parse($account_details)['id'] end  


