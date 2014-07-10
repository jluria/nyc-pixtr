require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root to: "homes#show"

  resource :session, only: [:new, :create, :destroy]

  resources :groups, only: [:index, :show, :new, :create] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end

  resource :dashboard, only: [:show]

  resources :users, only: [:new, :create, :show]
  resources :galleries do
    resources :images, only: [:new, :create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create]
    end
  end
end
