Rails.application.routes.draw do
  resources :scores
  resources :refresh_tokens
  resources :access_tokens
  resources :users

  post '/login', to: 'application#login'
  get '/profile', to: 'users#profile'
  get '/non_user_scores', to: 'score#non_user_scores'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
