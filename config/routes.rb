Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/home' => 'projects#index'

  get '/portfolio' => 'users#projects'

  get '/' => 'users#welcome'

  resources :skills

  resources :positions

  resources :projects

  resources :links

end
