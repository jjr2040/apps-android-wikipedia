require_relative '../data_manager/data_manager_account/AccountDataManager.rb'

Before() do
  $first_time_setup ||= false

  unless $first_time_setup
    $first_time_setup = true
    
    # call the data managers needed to create test data before
    # any of your calabash scenarios start

  #$account_details = AccountDataManager.new.create
  
  end
  
end

Before('@login') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/login_wikipedia.json?key=e66a4260')
end

Before('@search') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/search_wikipedia.json?key=e66a4260')
end

Before('@language') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/language_wikipedia.json?key=e66a4260')
end

Before('@searchw') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/gender_wikipedia.json?key=e66a4260')
end

Before('@listname') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/listname_wikipedia.json?key=e66a4260')
end

Before('@description') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/loremipsum_wikipedia.json?key=e66a4260')
end

Before('@searchlist') do
  # declare global variable that can be accessed by step_definition files
  $account_details = AccountDataManager.new.create('https://my.api.mockaroo.com/searchlist_wikipedia.json?key=e66a4260')
end

at_exit do
  # call the data managers to clean up test data
end