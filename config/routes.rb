Rails.application.routes.draw do
  root 'pages#index'

  resources :cards do
    member do
      get 'check'
    end
  end
end
