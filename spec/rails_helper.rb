require 'simplecov'

SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.include ModelsMacros
  config.include ActiveSupport::Testing::TimeHelpers
  config.backtrace_exclusion_patterns << /gems/
  config.infer_spec_type_from_file_location!
end
