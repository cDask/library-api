Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'user_token#create'
  post '/sign-up', to: 'users#create'
  get '/user', to: 'users#show'
  resources :books
  resources :borrows, only: %i[create destroy update index]
end
