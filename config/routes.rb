Rails.application.routes.draw do
  get 'welcome/index'
  resources :companies
  root 'welcome#index'


  get 'welcome/about'

  get 'welcome/privacy'

  get 'welcome/contact'

end
