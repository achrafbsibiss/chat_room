Rails.application.routes.draw do
  root 'pages#index'

  resources :rooms do
    resources :messages
  end
  devise_for :users, controllers: {
    sesions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'users/:id', to: 'users#show', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
