require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  setup do
    @category = Category.new({name: "Test Category", homepage: "# Hello World!!"})
  end

  test "Valid category" do
    assert @category.valid?, "Category with unique name and a homepage"
  end

  test "Category missing name" do
    @category.name = nil
    refute @category.valid?, "Category with missing name"
    assert_not_nil @category.errors[:name]
  end

  test "Category non unique name" do
    @category.name = "Finance Category"
    refute @category.valid?, "Category with duplicate name"
    assert_not_nil @category.errors[:name]
  end

  test "Category name longer than 50 characters" do
    @category.name = "-" * 51
    refute @category.valid?, "Category with name longer than 50"
    assert_not_nil @category.errors[:name]
  end
end
