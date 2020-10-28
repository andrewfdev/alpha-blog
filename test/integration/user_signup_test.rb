require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  test "get new user form and create user" do
    # get "/users/new"
    # assert_response :success
    assert_difference 'User.count', 1 do
      post users_path, params: { user: {username: "Andrew", email: "andrewfa@example.com", password: "password"} }  #:username, :email, :password
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Andrew", response.body
  end
end
