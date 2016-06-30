require "test_helper"

class FollowTest < Capybara::Rails::TestCase

  setup do
    @jwo = User.create! username: "jwo", password: "12345678"
    @bob = User.create! username: "bob", password: "12345678"
    @sarah = User.create! username: "sarah", password: "12345678"
  end

  test "jwo, when signed in, can follow sarah" do

    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: @jwo.username
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link 'All Users'
    click_link 'Follow sarah'

    visit root_path
    click_link "People You Follow"

    assert_content page, "sarah"

  end

  test "sarah can ghost jwo" do
    @sarah.follow(@bob)
    @sarah.follow(@jwo)

    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: @sarah.username
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link 'All Users'
    click_link 'Ghost jwo'

    visit root_path
    click_link "People You Follow"

    assert_content page, "bob"
    refute_content page, "jwo"

  end

end
