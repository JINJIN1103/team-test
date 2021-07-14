Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root to: 'homes#top'
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get '/home/about', to: 'homes#about', as: 'about'
  
  get '/search' => 'search#search'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
