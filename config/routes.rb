Rails.application.routes.draw do
  resource :top, controller: :top, only: [:index]

  resource :photo, controller: :photo, only: [] do
    post :upload
    get :cofirm
  end

  resource :information, controller: :information, only: [:index]

  root to: "top#index"
end
