Rails.application.routes.draw do
  get 'sessions/new'
  get 'posts/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root  'users#new'
  resources :users
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

end
