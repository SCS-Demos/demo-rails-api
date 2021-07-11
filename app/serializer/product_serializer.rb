# frozen_string_literal: true

class ProductSerializer < BaseSerializer
  set_type :product
  belongs_to :category

  attributes :name, :price
end
