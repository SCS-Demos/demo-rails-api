# frozen_string_literal: true

class CategorySerializer < BaseSerializer
  set_type :category

  attributes :name, :products_count
end
