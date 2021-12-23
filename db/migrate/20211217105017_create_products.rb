# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :description
      t.string :status
      t.string :image
      t.timestamps
    end
  end
end
