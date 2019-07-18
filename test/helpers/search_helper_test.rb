require 'test_helper'

class SearchHelperTest < ActionView::TestCase
  setup do
    @posts = categories(:dev_ops).posts
    @page = 1
  end

  test "Test get text preview" do
    post = Post.new
    # Post has no contents
    assert_equal "", get_text_preview(post)
    # Post overflows text limit
    post.contents = "# Hello World!\n *I'm a test post!* This should not be shown in preview"
    assert_equal "Hello World!\n I'm a test post!...", get_text_preview(post)
    # Post doesnt overflow text limit
    post.contents = "Full Post Shown"
    assert_equal "Full Post Shown\n", get_text_preview(post)
  end

  test "Test get max page" do
    # No posts are present
    @posts = []
    assert_equal 0, get_max_page
    # Multiple of RESULTS_PER_PAGE
    @posts = Array.new(RESULTS_PER_PAGE * 2) {nil}
    assert_equal 2, get_max_page
    # Not a multiple of RESULTS_PER_PAGE
    @posts = Array.new((RESULTS_PER_PAGE * 2) + 1) {nil}
    assert_equal 3, get_max_page
  end

  test "Test has left and right arrow" do
    # page = all and total pages = 1
    @page = -1
    @posts = [nil]
    assert !has_left_arrow
    assert !has_right_arrow
    # page = 1 and total pages = 1
    @page = 1
    assert !has_left_arrow
    assert !has_right_arrow
    # page = 1 and total pages > 1
    @posts = Array.new(RESULTS_PER_PAGE * 2) {nil}
    assert !has_left_arrow
    assert has_right_arrow
    # page = 2 and total pages = 2
    @page = 2
    assert has_left_arrow
    assert !has_right_arrow
    # page = 2 and total pages > 2
    @posts = Array.new(RESULTS_PER_PAGE * 3) {nil}
    assert has_left_arrow
    assert has_right_arrow
  end

  test "Test get lower page" do
    # page is negative (All results)
    @page = -1
    assert_equal 1, get_lower_page
    # page is > 0 or < 5
    @page = 1
    assert_equal 1, get_lower_page
    @page = 4
    assert_equal 1, get_lower_page
    # page >= 5
    @page = 5
    assert_equal 1, get_lower_page
    @page = 9
    assert_equal 5, get_lower_page
  end

  test "Test get higher page" do
    # Any arbitrary value for max_page
    MAX_PAGE = 10
    set_max_page MAX_PAGE
    # page is negative (All results)
    @page = -1
    assert_equal 5, get_higher_page
    # page is > MAX_PAGE - 4
    @page = 3
    assert_equal 7, get_higher_page
    # page >= MAX_PAGE - 4
    @page = 8
    assert_equal MAX_PAGE, get_higher_page
  end

  test "Test get paginated result" do
    # page < 0 (All results)
    @posts = Array.new(RESULTS_PER_PAGE * 3) do |num|
      num
    end
    @page = -1
    assert_equal @posts, get_paginated_results
    # page = 1
    @page = 1
    assert_equal @posts[0...20], get_paginated_results
    # page = 3
    @page = 3
    assert_equal @posts[40...60], get_paginated_results
    # Not enough results to fill entire array
    @posts = Array.new(RESULTS_PER_PAGE / 2) do |num|
      num
    end
    @page = 1
    assert_equal @posts, get_paginated_results
  end

  private

  def set_max_page max_page
    @posts = Array.new((RESULTS_PER_PAGE * max_page)) {nil}
  end

end
