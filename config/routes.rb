Rails.application.routes.draw do
  root 'pages#index'
  post 'calculator/add'
end
