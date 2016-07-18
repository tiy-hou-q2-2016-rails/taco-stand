require "test_helper"

class FollowTest < Capybara::Rails::TestCase

  setup do
    @jwo = User.create! email: "jwo@example.com", username: "jwo", password: "12345678"
    @bob = User.create! email: "bob@example.com", username: "bob", password: "12345678"
    @sarah = User.create! email: "sarah@example.com", username: "sarah", password: "12345678"
  end

  test "jwo can see tacos of people he follow" do

    @jwo.follow(@sarah)

    Taco.create! user: @sarah, name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
    Taco.create! user: @bob, name: "Fish Tacos", price: 6.50, photo_url: "http://www.thenovicechefblog.com/wp-content/uploads/2010/07/DSC_7383-1024x801.jpg"
    Taco.create! user: @bob, name: "Beef Fajitas", price: 5.56, photo_url: "http://grouchymuffin.com/wp-content/uploads/2013/05/lupe-tortillas-fajitas.jpg"
    Taco.create! user: @sarah, name: "Carnitas", price: 6.50, photo_url: "http://carnitassnackshack.com/wp-content/themes/carnitassnacks/images/home/home-carnitas-tacos.jpg"

    visit root_path
    click_link "New Taco"
    # I am on sign in page
    fill_in "Username", with: @jwo.username
    fill_in "Password", with: "12345678"
    click_button "Sign In"

    click_link 'Feed'
    assert_content page, 'Al Pastor'
    assert_content page, 'Carnitas'
    refute_content page, 'Beef Fajitas'
    refute_content page, 'Fish Tacos'

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
