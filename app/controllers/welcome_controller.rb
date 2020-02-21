class WelcomeController < ApplicationController
  def index

  end

  def search
    Company.search do
      fulltext 'apple'
    end
  end
end
