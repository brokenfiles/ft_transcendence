Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
end
