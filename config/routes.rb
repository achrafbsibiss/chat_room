Rails.application.routes.draw do
  root 'pages#index'

  resources :rooms do
    resources :messages
  end
  devise_for :users
  get 'users/show'
  get 'users/:id', to: 'users#show', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end
end
