class WelcomeController < ApplicationController
  def index
    if params[:search].blank?
      @results = Company.all
    else
      @parameter = params[:search]
      @results = Company.where(companyName: @parameter).or(Company.where(companySymbol: @parameter))
    end
  end
end
