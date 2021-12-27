# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, :price, :description, :status, :image, presence: true
end
