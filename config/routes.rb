Rails.application.routes.draw do
  get 'carts/show'

  resources :blogs

  get 'welcome/homepage'

  devise_for :users
  resources :posts, expect: [:show, :index, :edit] do
    collection do 
      get 'search'
    end
  	resources :comments
  end

  resources :productlines, expect: [:show, :index, :edit] do
  end  
  resources :products, expect: [:show, :index, :edit] do
  end

  root 'welcome#homepage'
  resources :blogs

  get 'pages/aboutus' => 'pages#aboutus'
  get 'pages/contactus' => 'pages#contactus'

  get 'productlines' => 'productlines#index'
  get 'productlines/:id' => 'productlines#show'
  get 'products' => 'products#index'
  
  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'

  get 'blogs' => 'blogs#index'

  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end
end
