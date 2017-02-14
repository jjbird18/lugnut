Rails.application.routes.draw do
  get 'pages/aboutus'

  get 'welcome/homepage'

  devise_for :users
  resources :posts, expect: [:show, :index, :edit] do
  	resources :comments
  end

  root 'welcome#homepage'

  get 'pages/aboutus' => 'pages#aboutus'
  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'
end
