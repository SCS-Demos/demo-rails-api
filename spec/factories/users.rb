FactoryBot.define do
  factory :user do
    traits_for_enum :user_type, %i[admin operator]

    user_type { :operator }
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8) }

    factory :admin, traits: [:admin]
  end
end
