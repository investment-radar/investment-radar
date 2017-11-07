source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
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
gem 'bourbon', git: 'https://github.com/thoughtbot/bourbon'
# A lightweight and flexible Sass grid http://neat.bourbon.io
gem "neat"
# Normalize.css is an alternative to CSS resets
gem 'normalize-rails'
# Autoprefixer for Ruby and Ruby on Rails
gem "autoprefixer-rails"

# Use Webpack to manage app-like JavaScript modules in Rails
gem 'webpacker', '~> 3.0'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# ActiveRecord backend integration for DelayedJob 3.0+
gem 'delayed_job_active_record'

# Mailgun's Official Ruby Library
gem 'mailgun-ruby', '~>1.1.6'

# A dead simple wrapper for yahoo finance quotes end-point.
gem 'yahoo-finance', :github => 'herval/yahoo-finance'

# Simple, but flexible HTTP client library, with support for multiple backends.
gem 'faraday'

# Flexible authentication solution for Rails with Warden.
gem 'devise'

# A Rails engine that helps you put together a super-flexible admin dashboard
gem "administrate"

# Easily include static pages in your Rails app.
gem 'high_voltage', '~> 3.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  gem 'pry-byebug'

  gem 'rspec-rails', '~> 3.6'

  # ffaker is a rewrite of faker
  gem "ffaker"

  gem 'factory_bot_rails'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  # Pretty print your Ruby objects with style -- in full color and with proper indentation
  gem 'awesome_print', require: 'ap'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Annotate Rails classes with schema and routes info
  gem 'annotate', require: false

  # A Ruby code quality reporter
  gem "rubycritic", require: false
end

group :test do
  # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging of coverage across test suites
  gem 'simplecov', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby "2.4.1"
