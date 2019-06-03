Rails.application.routes.draw do
  root to: 'home#index'
  resources :members do
    resources :friendships, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
