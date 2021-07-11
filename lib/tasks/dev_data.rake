# frozen_string_literal: true

namespace :dev_data do
  task populate: :environment do
    FactoryBot.create_list(:category_with_products, 10, products_size: 10)
  end
end
