Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :top, controller: :top, only: [:index]

  resource :photo, controller: :photo, only: [] do
    post :upload
    get :cofirm
  end

  resource :information, controller: :information, only: [:index]

  root to: "top#index"
end
