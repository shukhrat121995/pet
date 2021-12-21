Rails.application.routes.draw do
  resources :products, only: [:create, :index, :update, :destroy]  
end
