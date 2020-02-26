class WelcomeController < ApplicationController
  def index
    if params[:search].blank?
      @results = Company.all
    else
      @parameter = params[:search]
      @results = Company.where(companyName: @parameter)
    end
  end
end
