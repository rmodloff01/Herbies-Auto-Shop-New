Rails.application.routes.draw do
  resources :included_parts
  resources :suppliers
  resources :issues
  resources :invoices
  resources :parts
  resources :employees
  resources :cars
  resources :customers
  resources :home
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
