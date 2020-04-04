require 'rest-client'

class AccountDataManager


  def create(url)
    #url = 'https://my.api.mockaroo.com/login_wikipedia.json?key=e66a4260'
    response = RestClient.get url

    if response.code != 200
      fail(msg ="GET failed. Response status code was: '#{response.code}'")
    end

  
    # return a hash of account details
    account_details = response

  end
end