Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/menu', to: 'static_pages#menu'
  get '/drinks', to: 'static_pages#drinks'
  get '/signup', to: 'users#new'
  resources :users
end
