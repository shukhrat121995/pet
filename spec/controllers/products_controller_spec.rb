# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET' do
    it 'has a 200 status code' do
      get :index
      expect(response).to be_successful
    end
    it 'responds with a valid content type' do
      get :index
      expect(response.content_type).to include('application/json')
    end
  end

  describe 'POST' do
    product = FactoryBot.build :product

    it 'handles the request with valid parametrs' do
      post :create, params: {
        name: product.name,
        price: product.price,
        description: product.description,
        status: product.status,
        image: product.image
      }
      expect(response).to be_successful
    end

    it 'handles the request with invalid parametrs' do
      post :create, params: {
        name: '',
        price: product.price,
        description: product.description,
        status: product.status,
        image: product.image
      }
      expect(response).to have_http_status(400)
    end
  end

  describe 'PATCH' do
    before :each do
      @product = Product.create(
        name: 'MacBook Pro 14\'',
        price: 1999.99,
        description: '14 inch MacBook Pro, 512GB, 16GB RAM',
        status: 'active',
        image: 'None'
      )
    end

    it 'updates the object with valid parametrs' do
      patch :update, params: {
        id: @product.id,
        name: 'MacBook Air',
        price: @product.price,
        description: @product.description,
        status: @product.status,
        image: @product.image
      }

      expect(response).to be_successful
    end
  end
end
