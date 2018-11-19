# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# A Lightweight Sass Tool Set http://bourbon.io
gem 'bourbon'
# A lightweight and flexible Sass grid http://neat.bourbon.io
gem 'neat'
# Normalize.css is an alternative to CSS resets
gem 'normalize-rails'
# Autoprefixer for Ruby and Ruby on Rails
gem 'autoprefixer-rails'

# Use Webpack to manage app-like JavaScript modules in Rails
gem 'webpacker', '~> 3.3'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# ActiveRecord backend integration for DelayedJob 3.0+
gem 'delayed_job', github: 'collectiveidea/delayed_job'
gem 'delayed_job_active_record', '~>4.1.3'

# Mailgun's Official Ruby Library
gem 'mailgun-ruby', '~>1.1.6'

# A Ruby gem for communicating with the Twilio API and generating TwiML
gem 'twilio-ruby'

# Simple, but flexible HTTP client library, with support for multiple backends.
gem 'faraday'

# Flexible authentication solution for Rails with Warden.
gem 'devise', github: 'plataformatec/devise'

# A Rails engine that helps you put together a super-flexible admin dashboard
gem 'administrate'

# Easily include static pages in your Rails app.
gem 'high_voltage', '~> 3.0.0'

# Logging
# Lograge - Taming Rails' Default Request Logging
gem 'lograge'

# Raven is a Ruby client for Sentry Error Monitoring
gem 'sentry-raven'

# Create beautiful JavaScript charts with one line of Ruby
gem 'chartkick'

# A Gem for AlphaVantage
gem 'alphavantagerb'

# IEX Finance API Ruby Client
gem 'iex-ruby-client'

gem 'decision_engine', path: './gems/decision_engine'

# Catch unsafe migrations at dev time
gem 'strong_migrations'
# Zero downtime migrations with ActiveRecord and PostgreSQL
gem 'zero_downtime_migrations'

# Easiest way to add multi-environment yaml settings to Rails
gem 'config'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  gem 'pry-byebug'

  gem 'rspec-rails', '~> 3.8.1'

  # Collection of testing matchers extracted from Shoulda
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'

  # ffaker is a rewrite of faker
  gem 'ffaker'

  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'

  # Pretty print your Ruby objects with style -- in full color and with proper indentation
  gem 'awesome_print', require: 'ap'
end

group :development do
  # Annotate Rails classes with schema and routes info
  gem 'annotate', require: false

  # help to kill N+1 queries and unused eager loading
  gem 'bullet'

  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Code smell detector for Ruby
  gem 'reek', require: false

  # A Ruby static code analyzer, based on the community Ruby style guide
  gem 'rubocop', '~> 0.52.1', require: false
  gem 'rubocop-rspec', '~> 1.22.2', require: false

  # A Ruby code quality reporter
  gem 'rubycritic', '~> 3.3.0', require: false

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Set of matchers and helpers to allow you test your APIs responses
  gem 'rspec-json_expectations'
  # Library for stubbing and setting expectations on HTTP requests in Ruby.
  gem 'webmock'

  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov', require: false

  # A Page Object Model DSL for Capybara
  gem 'site_prism'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: :ruby
