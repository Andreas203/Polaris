class WelcomeController < ApplicationController
  def index
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
