Rails.application.routes.draw do
  resources :blacklists
  resources :rsvps
  mount ForestLiana::Engine => '/forest'
  devise_for :admins, controllers: {registrations: "admins/registrations"}
  devise_for :users, controllers: {registrations: "users/registrations"}
  root to: "pages#home"
  delete "/logout", to: "sessions#destroy"
  post "/signup", to: "sessions#create"
  post "/login", to: "sessions#create"
  get "about", to: "pages#about", as: :about
  # get 'admin' => 'admin#primary', as: :admin_root
  get 'users' => 'users#primary', as: :user_root
  get 'admins' => 'admin#primary', as: :admin_root
  get '/rsvp', to: 'rsvps#index', as: :answer
  get 'logistics' => 'users#logistics', as: :logical
  get 'activities' => 'users#activities', as: :active
  get 'register' => 'users#register', as: :registry
  get 'classification' => 'users#classification', as: :classified
  get 'blacklist' => 'blacklists#index', as: :unavailable
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
