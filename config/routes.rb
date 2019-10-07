Rails.application.routes.draw do
  root 'pages#index'
  
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'calculator/add'
      post 'audios/recognize'
    end
  end
end
