Rails.application.routes.draw do
  resources :comments
  resources :users
  resources :notes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'welcome/home', to: 'welcome#home'
  # get 'welcome/about', to: 'welcome#about'

  # root route
  root 'welcome#home'
  get 'about', to: 'welcome#about'
end
