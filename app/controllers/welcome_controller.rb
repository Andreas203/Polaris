class WelcomeController < ApplicationController
  def index
    if params[:search].blank?
      if @results.empty?
        @results = ["ome","doe","trese"]
      else
        @results = Company.all
      end
    else
      @parameter = params[:search]
      @results = Company.where(companyName: @parameter).or(Company.where(companySymbol: @parameter))
    end
  end
end
