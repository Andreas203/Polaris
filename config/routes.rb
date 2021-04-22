Rails.application.routes.draw do

  get 'welcome/index'

  get 'contact', :to => 'home#index', :as => :contact

  resources :home, only: [:new, :create]

  resources :companies
  root 'welcome#index'
  get 'welcome/contact'
  get 'careers', :to => 'welcome#careers', :as => :careers
  get 'about', :to => 'welcome#index', :as => :about
  get 'forecasts', :to => 'welcome#index', :as => :forecasts
  get 'privacy', :to => 'welcome#privacy', :as => :privacy


end
