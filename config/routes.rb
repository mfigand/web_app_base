# frozen_string_literal: true

Rails.application.routes.draw do
  get 'api/v1/ping', to: 'api/v1/ping#ping'

  scope module: 'web' do
    scope module: 'neighbour' do
      get '/', to: 'home#show', as: 'home'

      resources :passwords, only: %i[create new]

      resource :sessions, only: %i[create new destroy]

      resources :users, only: %i[create new show edit update destroy]
    end
  end
end
