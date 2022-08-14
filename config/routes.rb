Rails.application.routes.draw do

  resources :medicos
  root "home#index"
  resources :enderecos
  get '/pacientes/:id/nova-consulta', to: 'pacientes#newConsulta'
  # post "/patients/:id/nova-consulta" => "pacientes#createConsulta"
  resources :pacientes do
    resources :consulta
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
