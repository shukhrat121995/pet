# frozen_string_literal: true

class Product < ApplicationRecord
  include StatusHolder

  validates :name, :price, :description, :status, :image, presence: true

  hold_status :active, :inactive
end
