Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "/doctors/search" => "doctors#search"

  resources :doctors
  
  resources :appointments
  resources :patients
  resources :health_profiles


root to: 'pages#index'


end

