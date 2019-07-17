require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new post page" do
    get new_post_url
    assert_response :success
    test_page_title "New Post"
  end

  test "should get show page" do
    get post_url(posts(:software_dev_1))
    assert_response :success
    post = @controller.instance_variable_get(:@post)
    assert post.title == "Software Dev Post", "Should display software post"
    assert post.category.name == "Software Development Category", "Should display software post category"
    test_page_title "Software Dev Post"
  end

  test "should get edit page" do
    get edit_post_url(posts(:finance_1))
    assert_response :success
    assert @controller.instance_variable_get(:@post).title == "Finance Post", "Finance post should be displayed"
    test_page_title "Edit Finance Post"
  end

  test "should update posts" do
    post update_post_url(posts(:finance_1)), params: {post: {title: "Finance Post Changed", contents: "This post was changed"}}
    assert_redirected_to %r(^#{post_url(posts(:finance_1))})
    finance_post = @controller.instance_variable_get(:@post)
    assert finance_post.title == "Finance Post Changed" and finance_post.contents == "This post was changed"
  end

  test "should fail to update posts" do
    post update_post_url(posts(:finance_1)), params: {post: {title: "", contents: "This post was changed"}}
    url = @response.get_header("location")
    assert_match(/errors.*Title\+can.*t\+be\+blank/, url)
    assert_redirected_to %r(^#{edit_post_url(posts(:finance_1))}\?)
  end

  test "should delete post and posts" do
    assert_difference('Post.count', -1) do
      delete destroy_post_url(posts(:finance_1))
    end
    assert_redirected_to %r(^#{categories_url(posts(:finance_1).category)}\?)
  end
end
