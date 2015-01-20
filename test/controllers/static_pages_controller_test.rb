require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get front_page" do
    get :front_page
    assert_response :success
  end

end
