# frozen_string_literal: true

require "test_helper"

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  test "should get index" do
    sign_in users(:one)
    get root_url
    assert response.body.include? "Welcome #{users(:one).email}"
  end


  test "should get login form" do
    get root_url
    follow_redirect!
    assert_equal "/users/sign_in", path
  end
end
