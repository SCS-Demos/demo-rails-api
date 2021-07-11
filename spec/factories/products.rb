FactoryBot.define do
  factory :product do
    name { Faker::Commerce.unique.product_name }
    price { Faker::Commerce.price }
    category
  end
end
