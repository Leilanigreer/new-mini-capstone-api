ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner/active_record"

# Configure Database Cleaner
DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  setup do
    # This ensures we start with a clean database for each test
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end
end
