Rails.application.routes.draw do
  get 'sessions/new'
  root to: "tasks#index"
  resources :tasks, only: %i(index new create show edit update destroy) do
    collection do
    get 'search'
    end
  end
  resources :users, only: %i(new create show)
  resources :sessions, only: %i(new create destroy)
end
