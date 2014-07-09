Rails.application.routes.draw do
  root to: "homes#show"

  resource :session, only: [:new, :create, :destroy]

  resources :groups, only: [:index, :show, :new, :create]
  resources :users, only: [:new, :create, :show]
  resources :galleries do
    resources :images, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
  end
end
