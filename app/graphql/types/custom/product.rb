# frozen_string_literal: true

module Types
  module Custom
    class Product < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :price, Float, null: false
      field :available_quantity, Integer, null: false
      field :picture, String, null: false
    end
  end
end