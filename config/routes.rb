Rails.application.routes.draw do
  resources :suppliers
  resources :parts_includeds
  resources :issues
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
