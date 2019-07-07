require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name: "User",
                                         last_name: "Example",
                                         email: "user@example.com",
                                         password: "foobar",
                                         password_confirmation: "foobar"}}
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end
