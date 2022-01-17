Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :channels
  resources :questions
  resources :events
  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "articles#index"
  get 'home/about'
  get 'home/calculator'
end
