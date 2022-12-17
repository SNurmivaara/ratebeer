# README

[![Maintainability](https://api.codeclimate.com/v1/badges/040ca9def984d607f378/maintainability)](https://codeclimate.com/github/SNurmivaara/ratebeer/maintainability)

Coursework for web-server programming on Ruby on Rails 

Materials: https://github.com/mluukkai/WebPalvelinohjelmointi2022

App url on fly.io: https://withered-pine-8011.fly.dev/


## Useful commands

```
# Update gems
bundle update

# Install
bundle install

# Run db:migrations
rails db:migrate

# Run db:rollback
rails db:rollback

# Run server
rails s

# Run console
rails c

# Rubocop test and fix automatically fixable (-A)
rubocop -A

# Deploy to fly.io
fly deploy

# Check logs on fly.io
fly logs

# Access ruby console on fly.io
fly ssh console
/app/bin/rails c
```

### RSpec commands

```
# Generate rspec for new model
rails generate rspec:model <modelname>

# Run rspec tests with documentation format
rspec spec

# Run rspec on a more granular level
rspec spec</models/user_spec.rb>

```

### Debugging

```
# Add this to the line you wish to examine at
binding.pry
```