Rails.application.routes.draw do
  root 'customers#index'

  devise_for :users
  resources :suppliers
  resources :parts_includeds
  resources :issues

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'customers#index'

  resources :included_parts
  resources :suppliers
  resources :invoices
  resources :parts
  resources :employees
  resources :cars
  resources :customers
  resources :home
  resources :customers do
  member do
    get :showcar
  end
end
  resources :cars do
  member do
    get :showinvoice
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
