# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'support/factory_girl'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

#helper method to determine if Ruby class exists as a class
def class_exists?(class_name)
  eval("defined?(#{class_name}) && #{class_name}.is_a?(Class)") == true
end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  
  config.filter_rails_from_backtrace!
  
end
