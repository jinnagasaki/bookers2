Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  root to: 'home#index'		#homeをホーム画面に
  #root 'books#index' #ユーザー認証成功後
  resources :users, only: [:show]
  resources :books, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :books, only: [:create, :destroy]
   end
end
