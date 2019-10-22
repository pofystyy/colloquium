Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'pages#index'
  
               
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'calculator/add'
      post 'audios/recognize'
   end
  end
  post 'calculator/add'
  post 'audio/recognize'
  
  get '*path', to: 'pages#index'

  
end
