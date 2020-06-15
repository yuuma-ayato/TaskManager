Rails.application.routes.draw do
  get 'sessions/new'
  root to: "tasks#index"
  resources :tasks, only: %i(index new create show edit update destroy) do
    collection do
    get 'search'
    end
  end
  namespace :admin do
    resources :users, only: %i(new create show)
  end
  resources :sessions, only: %i(new create destroy)
end
