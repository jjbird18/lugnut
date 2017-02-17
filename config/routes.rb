Rails.application.routes.draw do
  resources :blogs

  get 'welcome/homepage'

  devise_for :users
  resources :posts, expect: [:show, :index, :edit] do
  	resources :comments
  end

  root 'welcome#homepage'
  resources :blogs

  get 'pages/aboutus' => 'pages#aboutus'
  get 'pages/contactus' => 'pages#contactus'

  get 'posts' => 'posts#index'
  get 'posts/:id' => 'posts#show'

  get 'blogs' => 'blogs#index'
end
