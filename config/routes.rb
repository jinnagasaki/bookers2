Rails.application.routes.draw do
  devise_for :users
  get 'home/index' => 'home#index'
  get 'home/about' => 'home#about'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root to: 'home#index'		#homeをホーム画面に
  resources :users, only: [:show]
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :books, only: [:create, :destroy]
   end
end
