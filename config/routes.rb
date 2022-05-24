Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


# Rails.application.routes.draw do
#   root to: “treehouses#home”
#   resources :treehouses, only: %i[index new create show] do
#     resources :bookings, only: %i[create new]
#   end
#   resources :dashboard, only: %i[show]
# end
