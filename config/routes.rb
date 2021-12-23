# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products, only: %i[create index update destroy]
end
