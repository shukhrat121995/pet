# frozen_string_literal: true

class Product < ApplicationRecord
  include StatusHolder

  validates :name, :price, :description, :status, :image, presence: true

  validates :name, length: { in: 2..20 }

  validates :description, length: { in: 20..1000 }

  validates :price, numericality: {
    greater_than_or_equal_to: 0
  }

  hold_status :active, :inactive
end
