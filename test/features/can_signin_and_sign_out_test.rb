require "test_helper"

class CanSigninAndSignOutTest < Capybara::Rails::TestCase

  setup do
  end

  test "Can Sign Out" do
    user = User.create! username: "example", password: "12345678"

    visit root_path
    click_link "New Taco"
    fill_in "Username", with: 'example'
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link "Sign Out"
    click_link "New Taco"
    assert_content "Sign In!"

  end

  test "Validates Password" do
    user = User.create! username: "example", password: "12345678"
    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: 'example'
    fill_in "Password", with: "1235678"
    click_button "Sign In"

    refute_content page, "Signed in!"

  end

  test "Can Sign In" do
    user = User.create! username: "example", password: "12345678"
    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: 'example'
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Signed in!"

  end

  test "Can Sign Up" do

    visit root_path
    click_link "Sign In"
    click_link "Sign Up"
    fill_in "Username", with: 'bob'
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign Up"

    assert User.find_by(username: 'bob').authenticate("12345678")
    assert_content page, "Signed in!"

  end

end
