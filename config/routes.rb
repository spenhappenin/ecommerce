Rails.application.routes.draw do
root 'store#index'

get '/about', to: 'shared#about', as: 'about'

resources :stores do
  resources :departments
end

resources :departments do
  resources :products
end
end
