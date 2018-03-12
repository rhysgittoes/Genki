Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

post "/doctors/search" => "doctors#search"
  resources :doctors
  resources :patients
  resources :health_profiles


  root to: 'pages#index'

end
