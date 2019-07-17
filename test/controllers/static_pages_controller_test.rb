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

end
