Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: {:omniauth_callbacks => "omniauth_callbacks"}
  root 'stores#index'

  get '/about', to: 'shared#about', as: 'about'
  get '/cart', to: 'cart#show', as: 'cart'
  get '/contact', to: 'shared#contact', as: 'contact'

  get 'all_stores', to: 'stores#all_stores'

  # Custom Routes To Add Songs To A Billboard
  post 'add_cart_product/:product_id', to: 'cart#add_product', as: 'add_cart_product'
  delete 'remove_cart_product/:product_id', to: 'cart#remove_product', as: 'remove_cart_product'

  resources :stores do
    resources :departments
  end

  resources :departments, except: [:index, :show, :edit, :new, :create, :update, :destroy]do
    resources :products
  end
end
