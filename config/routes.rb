Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'
  root to: "home#index"
  get 'about' => "pages#about", as: "about"
  patch "/posts/:id/like", to: "posts#dislike", as: "dislike"
  resources :posts do 
    resources :comments
  end
end
