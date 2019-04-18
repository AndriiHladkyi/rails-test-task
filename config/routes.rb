Rails.application.routes.draw do
  resources :posts do
    get 'create_shared_url', on: :member
  end
  resources :categories

  root 'categories#index'
end
