Rails.application.routes.draw do
  resources :styles
  resources :beer_clubs
  resources :users
  resources :beers
  resources :breweries
  resources :ratings, only: [:index, :new, :create, :destroy]
  resources :memberships, only: [:index, :new, :create, :destroy]
  resources :places, only: [:index, :show]
  resource :session, only: [:new, :create, :destroy]
  #get 'ratings', to:'ratings#index'
  #get 'ratings/new', to:'ratings#new'
  #post 'ratings', to:'ratings#create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#destroy'
  post 'places', to: 'places#search'
  delete 'memberships', to: 'memberships#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'breweries#index'
end