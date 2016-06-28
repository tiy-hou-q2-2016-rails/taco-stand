require "test_helper"

class CanViewTacosOnHomepageTest < Capybara::Rails::TestCase

  setup do
    Taco.create! name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
    Taco.create! name: "Fish Tacos", price: 6.50, photo_url: "http://www.thenovicechefblog.com/wp-content/uploads/2010/07/DSC_7383-1024x801.jpg"
    Taco.create! name: "Beef Fajitas", price: 5.56, photo_url: "http://grouchymuffin.com/wp-content/uploads/2013/05/lupe-tortillas-fajitas.jpg"
    Taco.create! name: "Carnitas", price: 6.50, photo_url: "http://carnitassnackshack.com/wp-content/themes/carnitassnacks/images/home/home-carnitas-tacos.jpg"
  end


  test "tacos show on root" do

    visit root_path
    assert_content page, "TacoStand"
    assert_content page, "Carnitas"

    assert_equal 4, Taco.count

    # save_and_open_page
  end
end
