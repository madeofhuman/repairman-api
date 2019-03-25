Rails.application.routes.draw do
  resources :cars do
    resources :quotes
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
