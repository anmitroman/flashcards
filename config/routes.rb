Rails.application.routes.draw do
  root 'pages#index'

  resources :cards, only: [:index, :show]
end
