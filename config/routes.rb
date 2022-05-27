Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :treehouses do
    resources :bookings, only: %i[create new]
    resources :reviews, only:  %i[create index]
  end
  resources :dashboards, only: %i[index]
  get "booking/:id/approve", to: "dashboards#approve_status", as: :approve_status
  get "booking/:id/reject", to: "dashboards#reject_status", as: :reject_status
end
