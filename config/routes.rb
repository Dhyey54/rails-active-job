require 'sidekiq/web'
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sidekiq"
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"

  resources :events do
    member do
      get 'enroll'
      delete 'discard'
    end
  end
  resources :employees, only: [:index]
end
