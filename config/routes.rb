Rails.application.routes.draw do

  scope module: :public do
  resource :users, only: [:show, :edit, :update]
  resources :communities
  resources :comments
  resources :goods
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'


  namespace :admin do
  resources :users
  resources :communities
  resources :comments
  end

  get 'admin/' => 'admin/homes#top'

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :goods
  devise_for :comments
  devise_for :communities
  #devise_for :admins
  #devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
