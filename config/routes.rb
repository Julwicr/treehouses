Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :treehouses, only: %i[index new create show] do
    resources :bookings, only: %i[create new]
  end
  resources :dashboards, only: %i[index]

  # Defines the root path route ("/")
  # root "articles#index"
end
