Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :treehouses do
    resources :bookings, only: %i[create new]
    resources :reviews, only: :create
  end
  resources :dashboards, only: %i[index]
end
