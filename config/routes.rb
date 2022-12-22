Rails.application.routes.draw do
  devise_for :goods
  devise_for :comments
  devise_for :communities
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
