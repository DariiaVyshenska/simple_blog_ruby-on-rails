Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  resources :comments, only: :index

  get '/login', to: 'users#new', as: 'register'
end
