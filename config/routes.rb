Rails.application.routes.draw do

  resources :projects
  resources :contacts
  resources :companies
root 'root#index'
end
