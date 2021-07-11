# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.admin.create_with(name: Faker::Name.name, password: 'password@1234').find_or_create_by(email: 'user.admin@email.com')
User.operator.create_with(name: Faker::Name.name, password: 'password@1234').find_or_create_by(email: 'user.operator@email.com')
