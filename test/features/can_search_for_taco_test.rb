require "test_helper"

class CanSearchForTacoTest < Capybara::Rails::TestCase
  setup do
    the_user = User.create! email: "jwo@example.com", username: "jwo", password: "12345678"

    Taco.create! user: the_user, name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
    Taco.create! user: the_user, name: "Fish Tacos", price: 6.50, photo_url: "http://www.thenovicechefblog.com/wp-content/uploads/2010/07/DSC_7383-1024x801.jpg"
    Taco.create! user: the_user, name: "Beef Fajitas", price: 5.56, photo_url: "http://grouchymuffin.com/wp-content/uploads/2013/05/lupe-tortillas-fajitas.jpg"
    Taco.create! user: the_user, name: "Carnitas", price: 2.50, photo_url: "http://carnitassnackshack.com/wp-content/themes/carnitassnacks/images/home/home-carnitas-tacos.jpg"

  end

  test "Can search for fish tacos" do
    visit root_path
    fill_in "Search for:", with: "Fish"
    click_button "Search"
    refute_content page, "Carnitas"
    assert_content page, "Fish Tacos"
  end

  test "Can search for cheap tacos" do
    visit root_path
    select "3", from: "Maximum Price"
    click_button "Search"
    assert_content page, "Carnitas"
    refute_content page, "Fish Tacos"
  end

  test "No Tacos for cheap people" do
    visit root_path
    select "2", from: "Maximum Price"
    click_button "Search"
    assert_content page, "No Tacos Found"
  end

end
