ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def login
    User.create(email: 'mat@schaffer.me',
                password: 'test1234')
    visit new_user_session_path
    fill_in 'Email', with: 'mat@schaffer.me'
    fill_in 'Password', with: 'test1234'
    click_button 'Sign in'
  end
end
