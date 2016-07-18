require "test_helper"

class CanSigninAndSignOutTest < Capybara::Rails::TestCase

  setup do
    User.create! email: "example@example.com", username: "example", password: "12345678"
  end

  test "Can Sign Out" do

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
    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: 'example'
    fill_in "Password", with: "1235678"
    click_button "Sign In"

    refute_content page, "Signed in!"

  end

  test "Can Sign Up" do
    visit root_path
    click_link "New Taco"
    # I am on sign in page
    click_link "Sign Up"
    fill_in "Email", with: 'jwo@example.com'
    fill_in "Username", with: 'jwo'
    fill_in "Password", with: "12345678"
    fill_in "Password confirmation", with: "12345678"
    click_button "Sign Up"

    assert_content page, "Welcome!"

  end

  test "Can Sign In" do
    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: 'example'
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    assert_content page, "Signed in!"

  end

end
