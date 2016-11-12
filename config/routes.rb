Rails.application.routes.draw do
root 'shared#home'

get '/about', to: 'shared#about', as: 'about'
get '/cart', to: 'cart#index', as: 'cart'
get '/contact', to: 'shared#contact', as: 'contact'


resources :cart

resources :stores do
  resources :departments
end

resources :departments, except: [:index, :show, :edit, :new, :create, :update, :destroy]do
  resources :products
end
end
