Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  root 'products#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

end


# standard way, 
# because CRUD created actions in conrtoller(products)
# get '/products/:id', to: 'products#show'