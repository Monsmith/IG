Rails.application.routes.draw do
  get 'pages/home'
  get 'profiles/show'
  get 'sessions/new'
  get 'posts/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
   resources :comments
   member do
     get 'like'
   end
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  root 'pages#home'
  get 'about', to: 'pages#about'
  get ':name', to: 'profiles#show', as: :profile
  get ':name/edit', to: 'profiles#edit', as: :edit_profile
  patch ':name/edit', to: 'profiles#update', as: :update_profile
end
