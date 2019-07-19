require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = Post.new({title: "Test Post", contents: "# Hello World!!", category: categories(:dev_ops)})
  end

  test "Valid post" do
    assert @post.valid?, "Post with title, category, and a contents"
  end

  test "Post is missing category" do
    @post.category = nil
    refute @post.valid?
  end

  test "Post missing title" do
    @post.title = nil
    refute @post.valid?, "Post with missing title"
    assert_not_nil @post.errors[:title]
  end

  test "Post title longer than 50 characters" do
    @post.title = "-" * 51
    refute @post.valid?, "Post with title longer than 50"
    assert_not_nil @post.errors[:title]
  end
end
