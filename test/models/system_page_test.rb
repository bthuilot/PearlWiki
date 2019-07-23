require 'test_helper'

class SystemPageTest < ActiveSupport::TestCase
  setup do
    # Need to load in default system pages
    # These are created in `seeds.rb` so
    # This command loads it in before the tests run
    Rails.application.load_seed
    @system_page = SystemPage.new({name: "Test SystemPage", contents: "# Hello World!!"})
  end

  test "Valid system_page" do
    assert @system_page.valid?, "SystemPage with unique name and a contents"
  end

  test "SystemPage missing name" do
    @system_page.name = nil
    refute @system_page.valid?, "SystemPage with missing name"
    assert_not_nil @system_page.errors[:name]
  end

  test "SystemPage non unique name" do
    @system_page.name = "Home"
    refute @system_page.valid?, "SystemPage with duplicate name"
    assert_not_nil @system_page.errors[:name]
  end

end
