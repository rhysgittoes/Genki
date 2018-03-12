Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

post "/doctors/search" => "doctors#search"
=======
  
  get "/doctors/search" => "doctors#search"
>>>>>>> f4430608d40d7fd07e202830492dd8b9cb2dea57
  resources :doctors
  
  resources :appointments
  resources :patients
  resources :health_profiles

<<<<<<< HEAD

=======
>>>>>>> f4430608d40d7fd07e202830492dd8b9cb2dea57
  root to: 'pages#index'

end

