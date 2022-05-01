Rails.application.routes.draw do
  devise_for :users


  # get 'users/show'
  # get 'users/edit'
  # 上の二行を下の一行へ書き換える
  resources :users, only: [:show, :edit, :update]

  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'
  # 上の三行を下の一行に変える
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only:[:create, :destroy]
  end

  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
