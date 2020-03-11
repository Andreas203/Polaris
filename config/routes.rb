Rails.application.routes.draw do

  resources :home, only: [:index, :new, :create]
  get 'home/index'


  get 'welcome/index'
  resources :companies
  root 'welcome#index'





  get 'welcome/contact'

  get 'contact/new'






  get 'careers', :to => 'welcome#careers', :as => :careers
  get 'about', :to => 'welcome#about', :as => :about
  get 'forecasts', :to => 'welcome#index', :as => :forecasts
  get 'privacy', :to => 'welcome#privacy', :as => :privacy





end
