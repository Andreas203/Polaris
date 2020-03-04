class WelcomeController < ApplicationController
  def index
    if params[:search].blank? && !(Company.first.nil?)
      @results = Company.all
    elsif !(Company.first.nil?)
      @parameter = params[:search]
      @results = Company.where(companyName: @parameter).or(Company.where(companySymbol: @parameter))
    else
      @results = ["two", "four", "tres"]
    end
  end
end
