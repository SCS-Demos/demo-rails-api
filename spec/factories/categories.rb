FactoryBot.define do
  factory :category do
    sequence(:name) { |i| "Category #{i}" }

    factory :category_with_products do
      transient do
        products_size { 5 }
      end

      after(:create) do |category, evaluator|
        create_list(:product, evaluator.products_size, category: category)
        category.reload
      end
    end
  end
end
