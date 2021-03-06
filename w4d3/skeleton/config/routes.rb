NinetyNineCatsDay1::Application.routes.draw do
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:create, :new] do
    post "approve", on: :member
    post "deny", on: :member
  end

  root to: redirect("/cats")

  resource :sessions, only: [:new, :create, :destroy ]


  resources :users, only: [:show, :new, :create]
end
