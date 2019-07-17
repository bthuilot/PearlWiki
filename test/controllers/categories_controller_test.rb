require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "should get new category page" do
    get new_categories_url
    assert_response :success
    test_page_title "Create Category"
  end

  test "should get show page" do
    get categories_url(categories(:software_dev))
    assert_response :success
    assert @controller.instance_variable_get(:@category).name == "Software Development Category", "Should display software category"
    test_page_title "Software Development Category"
  end

  test "should get edit page" do
    get edit_categories_url(categories(:admin))
    assert_response :success
    assert @controller.instance_variable_get(:@category).name == "Admin Category", "Admin category should be displayed"
    test_page_title "Edit Admin Category"
  end

  test "should update categories" do
    post update_categories_url(categories(:admin)), params: {category: {name: "Admin Category Changed", homepage: "This category was changed"}}
    assert_redirected_to %r(^#{categories_url(categories(:admin))})
    admin = @controller.instance_variable_get(:@category)
    assert admin.name == "Admin Category Changed" and admin.homepage == "This category was changed"
  end

  test "should fail to update categories" do
    post update_categories_url(categories(:admin)), params: {category: {name: "", homepage: "This category was changed"}}
    assert_redirected_to %r(^#{edit_categories_url(categories(:admin))}\?)
  end

  test "should delete category and posts" do
    assert_difference(-> {Category.count} => -1, -> {Post.count} => -10) do
      delete destroy_categories_url(categories(:admin))
    end
    assert_redirected_to %r(^#{root_url}\?)
  end

end
