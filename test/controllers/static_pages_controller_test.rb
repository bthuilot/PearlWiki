require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # Need to load in default system pages
    # These are created in `seeds.rb` so
    # This command loads it in before the tests run
    Rails.application.load_seed
  end

  test "should get home page" do
    get root_url
    test_page_title "Home"
    all_categories = @controller.instance_variable_get(:@categories)
    assert_equal all_categories.length, categories.length
  end

  test "should get about page" do
    get about_url
    test_page_title "About"
    all_categories = @controller.instance_variable_get(:@categories)
    assert_equal all_categories.length, categories.length
  end

  test "should update about page" do
    # Sending name param should not change the name for about
    post update_about_url, params: {system_page: {name: "Test", contents: "Updated Page Description"}}
    get about_url
    assert_response :success
    assert_equal "Updated Page Description", @controller.instance_variable_get(:@about).contents
  end

  test "should update home page" do
    # Sending name param should not change the name for home
    post update_home_url, params: {system_page: {name: "Test", contents: "Updated Page Description"}}
    get root_url
    assert_response :success
    assert_equal "Updated Page Description", @controller.instance_variable_get(:@home).contents
  end

  test "should get edit home page" do
    get edit_home_url
    assert_response :success
    test_page_title "Edit Home"
  end


  test "should get edit about page" do
    get edit_about_url
    assert_response :success
    test_page_title "Edit About"
  end
end
