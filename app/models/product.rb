# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category, counter_cache: true

  default_scope { order(name: :asc) }
  scope :search_by_category, ->(category_id) { where(category_id: category_id) }

  validates :name, presence: true, uniqueness: { scope: :category }
  # validates :category, presence: true # belongs_to required by defaults
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 100_000_000 }
end
