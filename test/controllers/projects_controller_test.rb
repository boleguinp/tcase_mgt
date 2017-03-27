require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get 'projects#index'
    assert_response :success
  end
end
