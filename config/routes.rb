Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #creating a route events/home that will take user to the home page

  root 'events#home'

end
