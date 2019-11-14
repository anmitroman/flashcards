Rails.application.routes.draw do
  root 'pages#index'

  resources :cards, only: [:index, :show]

  resources :cards do
    post 'check', to: 'cards#check'
  end
end
