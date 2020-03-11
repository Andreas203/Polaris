Rails.application.routes.draw do

  resources :home, only: [:index, :new, :create]
  get 'home/index'


  get 'welcome/index'
  resources :companies
  root 'welcome#index'


  get 'welcome/about'

  get 'welcome/privacy'

  get 'welcome/contact'

end
