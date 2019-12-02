Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root 'posts#index', as: 'home'
  root to: "home#index"
  get 'about' => "pages#about", as: "about"
  patch "/posts/:id/like", to: "posts#dislike", as: "dislike"
  resources :posts do 
    resources :comments
  end
  resources :conversations do
    resources :messages
  end
  root 'conversations#index'
end
