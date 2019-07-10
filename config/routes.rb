Rails.application.routes.draw do
  resources :cars do
    resources :quotes do
      resources :comments
    end
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  get 'admin/cars', to: 'cars#all_cars'
  get 'admin/quotes', to: 'quotes#all_quotes'
  get 'admin/quotes/:id', to: 'quotes#show_quote'
  post 'admin/quotes/:quote_id/comments', to: 'comments#create'
  get 'admin/quotes/:quote_id/comments/:id', to: 'comments#show_comment'

  get 'users/:id/quotes', to: 'quotes#user_quotes'

  match '*path', to: 'application#not_found', via: :all

end
