Rails.application.routes.draw do

root 'shared#home'

get '/about', to: 'shared#about', as: 'about'
get '/cart', to: 'cart#index', as: 'cart'
get '/contact', to: 'shared#contact', as: 'contact'

# Custom Routes To Add Songs To A Billboard
get 'new_cart_product/:id', to: 'cart#new_product', as: 'new_cart_product'
post 'add_cart_product/:id/:product_id', to: 'carts#add_product', as: 'add_cart_product'

resources :cart

resources :stores do
  resources :departments
end

resources :departments, except: [:index, :show, :edit, :new, :create, :update, :destroy]do
  resources :products
end
end
