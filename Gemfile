source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
gem 'redis-namespace'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# add

# use postgres enum type
gem 'activerecord-postgres_enum'

# authenticate, authorize
gem 'jwt'
gem 'pundit'

# pagination
gem 'kaminari'

# deploy
# gem 'capistrano', '~> 3.16', require: false
# gem 'capistrano-bundler', require: false
# gem 'capistrano-rails', require: false
# gem 'capistrano-rvm', require: false
# gem 'capistrano-sidekiq'

# job
gem 'sidekiq'
# gem 'sidekiq-limit_fetch'
# gem 'sidekiq-worker-killer'

# serializer
gem 'jsonapi-serializer'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  # rubocop
  gem 'rubocop', require: false
  gem 'rubocop-rails'

  # test
  gem 'rspec'
  gem 'rspec-rails'

  # data factory
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # add

  # profiler
  # gem 'benchmark-ips'
  # gem 'benchmark-memory'
  gem 'bullet'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
