Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #creating a route pages/home that will take user to the home page

  root 'pages#home'

  #creates many routes: index, create, new, edit, update, destroy, show

  resources :events

  get 'signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

  #render sessions#new as signin
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: 'sessions#destroy'


end
