if Rails.env.test?
  # There is a issue user model load before simplecov
  # so we need require simplecov here and start it.
  require 'simplecov'
  SimpleCov.start 'rails'

  puts "Simplecov loaded!"
end
