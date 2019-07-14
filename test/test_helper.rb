ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # Returns true if a test user is logged in.

  def is_logged_in?
    !session[:user_id].nil?
  end



  def sign_in_as(user, password)
    post signin_path, params: { session: { email: user.email, password: password } }
  end
end
