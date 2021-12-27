# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { build :product }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:image) }
  end

  describe 'types' do
    it 'checks class type of fields' do
      expect(product.name).to be_kind_of String
      expect(product.price).to be_kind_of Float
      expect(product.description).to be_kind_of String
      expect(product.image).to be_kind_of String
    end
  end

  describe 'status value validation' do
    statuses = %w[active inactive]
    it { is_expected.to validate_inclusion_of(:status).in_array(statuses) }
  end
end
