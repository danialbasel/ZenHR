Rails.application.routes.draw do
  namespace :api do
    resources :job_posts,:except => [:show]
    resources :job_applications, :except => [:update, :destroy]

    post '/auth/register', to:'users#register'
    post '/auth/login', to: 'users#login'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
