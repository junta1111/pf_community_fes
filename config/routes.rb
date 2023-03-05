Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions',
    #post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }



  scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get 'users/unsubscribe' => 'users#unsubscribe'
  patch 'users/withdraw' => 'users#withdraw'
  resources :users, only: [:show, :edit, :update]
  resources :communities
  get 'community/search' => 'communities#search'
  get 'communities/search_results' => 'communities#search_results'
  resources :comments do
  resource :goods, only: [:create, :destroy]
  end
  end

  namespace :admin do
  root to: 'homes#top'
  resources :users
  resources :communities
  resources :comments
  end

  #devise_for :admins
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
