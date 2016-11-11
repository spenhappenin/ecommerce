Rails.application.routes.draw do

root 'store#index'

get '/about', to: 'shared#about', as: 'about'
get '/cart', to: 'cart#index', as: 'cart'

resources :cart

resources :stores do
  resources :departments
end

resources :departments, except: [:index, :show, :edit, :new, :create, :update, :destroy]do
  resources :products
end
end
