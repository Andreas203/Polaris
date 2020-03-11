Rails.application.routes.draw do

<<<<<<< HEAD
  resources :home, only: [:index, :new, :create]
  get 'home/index'


=======
  get 'contacts/new'
  resources :contacts, only: [:new, :create]

  get 'contact/new'
>>>>>>> 80cca31d894833b8ae9857b9f180540951dff505
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
