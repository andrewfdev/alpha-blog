require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com",
                              password: "password", admin: true)
  end

  test "get new article form and create article" do
    sign_in_as(@admin_user)
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "Type of Sports Injuries for Football", description: "this is a description of football sports injuries", category_ids: []} }   #:title, :description, category_ids: []
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Type of Sports", response.body
  end
end
