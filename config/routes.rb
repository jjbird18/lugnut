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

  resource :cart, only: [:show] do
    get "add/:id", :as => "add", action: 'add'
    delete 'remove', path: 'destroy/:id'
  end

  resources :contacts, only: [:new, :create]

  root 'welcome#homepage'
  resources :blogs

  get 'pages/aboutus' => 'pages#aboutus'
  get 'pages/contactus' => 'contacts#new'
  get 'contacts' => 'contacts#new'

  get 'productlines' => 'productlines#index'
  get 'productlines/:id' => 'productlines#show'
  get 'products' => 'products#index'

  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'

  get 'blogs' => 'blogs#index'

  
end
