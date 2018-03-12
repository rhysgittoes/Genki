Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :doctors
  resources :patients
  resources :health_profiles

  get "/doctors/search" => "doctors#search"
  root to: 'pages#index'
end
