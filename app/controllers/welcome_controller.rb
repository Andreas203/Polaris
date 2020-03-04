class WelcomeController < ApplicationController
  def index
    if params[:search].blank?
      @results = Company.all
    else
      @parameter = params[:search]
      @results = ["four", "two", "three"] #Company.where(companyName: @parameter).or(Company.where(companySymbol: @parameter))
    end
  end
end
