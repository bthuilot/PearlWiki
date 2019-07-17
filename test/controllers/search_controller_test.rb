require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search_all" do
    get search_search_all_url
    assert_response :success
  end

end
