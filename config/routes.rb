Rails.application.routes.draw do
  root 'pages#index'
  # match '*path', to: 'pages#index', via: :all
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :calculator, only: [:index, :create]
      # post 'calculator/add'

      resources :audios, only: [:index, :create]
      # post 'audios/recognize'
    end
  end

   # match '*path', to: 'pages#index', via: :all
end
