##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.3](https://github.com/SCS-Demos/demo-rails-api/blob/master/.ruby-version#L1)
- Rails [6.1.4](https://github.com/SCS-Demos/demo-rails-api/blob/master/Gemfile#L7)

##### 1. Check out the repository

```bash
git clone git@github.com:SCS-Demos/demo-rails-api.git
cd demo-rails-api
```

##### 2. Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```bash
gem install bundler
# skip above line if already install gem bundler
bundle install
```

##### 3. Create and setup the database

Copy file sample or create new file `config/database.yml`

```bash
  cp config/database.yml.sample config/database.yml
```

Run the following commands to create and setup the database.

```ruby
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

##### Populate test data
```ruby
bundle exec rake dev_data:populate
```
