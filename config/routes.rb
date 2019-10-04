Rails.application.routes.draw do
  root 'pages#index'
  # match '*path', to: 'pages#index', via: :all
  resources :calculator, only: [:index]
  post 'calculator/add'

  resources :audios, only: [:index]
  post 'audios/recognize'
end
