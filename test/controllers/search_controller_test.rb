require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "Should get search page" do
    get search_url
    assert_response :success
    assert_equal 32, @controller.instance_variable_get(:@posts).length
    assert_select ".list-group-item", {count: 20}
    assert_equal 1, @controller.instance_variable_get(:@page)
    assert_select ".all-results-button", "All Results (32)"
    assert_select ".next-page-button", "keyboard_arrow_right"
    assert_select ".prev-page-button", {count: 0}
    assert_select ".page-buttons", {count: 2}
    assert_select ".list-group-item", {count: 20}
    assert_select ".page-buttons.active", {count: 1}
  end

  test "Should get all results" do
    get search_url, params: {page: -1}
    assert_response :success
    assert_equal -1, @controller.instance_variable_get(:@page)
    assert_select ".prev-page-button", {count: 0}
    assert_select ".next-page-button", {count: 0}
    assert_select ".page-buttons.active", {count: 0}
    assert_select ".list-group-item", {count: 32}
    assert_select ".all-results-button.active", "All Results (32)"
  end

  test "Should get page 2" do
    get search_url, params: {page: 2}
    assert_response :success
    assert_equal 2, @controller.instance_variable_get(:@page)
    assert_select ".page-buttons.active", {value: 2}
    assert_select ".prev-page-button", {count: 1}
    assert_select ".next-page-button", {count: 0}
    assert_select ".list-group-item", {count: 12}
  end

  test "Should only get posts in dev ops category" do
    get search_url, params: {search: {category: categories(:dev_ops).id}}
    assert_response :success
    assert_equal 1, @controller.instance_variable_get(:@page)
    assert_select ".page-buttons.active", {value: 1}
    assert_select ".prev-page-button", {count: 0}
    assert_select ".next-page-button", {count: 0}
    assert_select ".list-group-item", {count: 20}
    assert_select ".list-group-item" do
      assert_select "div small", "Category: Developer Operations Category"
    end
  end

  test "Should only get posts with 0 in title" do
    get search_url, params: {search: {term: "0"}}
    assert_response :success
    assert_equal 1, @controller.instance_variable_get(:@page)
    assert_select ".page-buttons.active", {value: 1}
    assert_select ".prev-page-button", {count: 0}
    assert_select ".next-page-button", {count: 0}
    assert_select ".list-group-item", {count: 3}
    assert_select ".list-group-item" do
      assert_select "h5", /.+0/
    end
  end

  test "Should only get posts with 0 in title and in dev ops category" do
    get search_url, params: {search: {category: categories(:dev_ops).id, term: "0"}}
    assert_response :success
    assert_equal 1, @controller.instance_variable_get(:@page)
    assert_select ".page-buttons.active", {value: 1}
    assert_select ".prev-page-button", {count: 0}
    assert_select ".next-page-button", {count: 0}
    assert_select ".list-group-item", {count: 2}
    assert_select ".list-group-item" do
      assert_select "h5", /.+0/
    end
    assert_select ".list-group-item" do
      assert_select "div small", "Category: Developer Operations Category"
    end
  end
end
