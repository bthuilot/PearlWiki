require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get search_all" do
    get search_search_all_url
    assert_response :success
  end

  test "should get search_category" do
    get search_search_category_url
    assert_response :success
  end

end
