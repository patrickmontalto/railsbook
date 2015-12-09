ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require "minitest/rails/capybara"
Minitest::Reporters.use!

def log_in_user
  @user = users(:one)
  visit new_user_session_path
  fill_in("user[email]", with: "one@google.com")
  fill_in("user[password]", with: "password1")
  click_button "Log in"
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here..
end
