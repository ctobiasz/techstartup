Rails.application.routes.draw do
  # Serve websocket cable requests in-process
mount ActionCable.server => '/cable'

root "pages#home"

resources :pages
resources :posts
resources :users, only:[:index, :edit, :update]
resources :categories, only: [:index, :show]
resources :sessions, only: [:new, :create, :destroy]
resources :boroughs, only: [:show]


#Stripe
resources :charges

resources :users, only:[:new, :create, :show] do
   resources :chats, only: [:index, :show, :create]
  end

resources :messages, only:[:create]

get 'locations/manhattan', to: 'locations#manhattan'
get 'locations/brooklyn', to: 'locations#brooklyn'
get 'locations/queens', to: 'locations#queens'
get 'locations/the_bronx', to: 'locations#the_bronx'
get 'locations/staten_island', to: 'locations#staten_island'
get '/login', to: 'sessions#login'
post '/login', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'

get '/categories', to: 'categories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
