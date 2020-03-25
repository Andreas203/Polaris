class WelcomeController < ApplicationController


  def index  


    @client = IEX::Api::Client.new(
      publishable_token: 'Tpk_1e2d87b88e704392a7aca5cc4a86797a',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

  
    
    if !(Company.first.nil?)
      @results = Company.all



    else
      @results = ["two", "four", "tres"]
    end
  end

  def new
    @contact_form = ContactForm.new
  end



end
