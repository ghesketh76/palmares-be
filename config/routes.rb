Rails.application.routes.draw do
  resources :access_tokens
  resources :users

  post '/login', to: 'application#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
