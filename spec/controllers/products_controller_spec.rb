# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'GET index' do
    subject(:product) { response }
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
    it 'responds with a valid content type' do
      get :index
      puts response.content_type.to_yaml
      expect(response.content_type).to include('application/json')
    end
  end
end
