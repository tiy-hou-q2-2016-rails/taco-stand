require "test_helper"

class CreateUpdateAndDeleteTacosTest < Capybara::Rails::TestCase


  setup do
    the_user = User.create! username: "jwo", password: "12345678"

    Taco.create! user: the_user, name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
    Taco.create! user: the_user, name: "Fish Tacos", price: 6.50, photo_url: "http://www.thenovicechefblog.com/wp-content/uploads/2010/07/DSC_7383-1024x801.jpg"
    Taco.create! user: the_user, name: "Beef Fajitas", price: 5.56, photo_url: "http://grouchymuffin.com/wp-content/uploads/2013/05/lupe-tortillas-fajitas.jpg"
    Taco.create! user: the_user, name: "Carnitas", price: 6.50, photo_url: "http://carnitassnackshack.com/wp-content/themes/carnitassnacks/images/home/home-carnitas-tacos.jpg"

  end

  test "Can view detail" do
    visit root_path
    click_link "Al Pastor"
    assert_content page, "Al Pastor"
    assert_content page, 5.65
  end


  test "tacos show on root" do

    visit root_path
    assert_content page, "TacoStand"
    assert_content page, "Carnitas"

    assert_equal 4, Taco.count

    # save_and_open_page
  end

  test "Creating Taco" do
    sign_in_user

    visit root_path
    click_link "New Taco"
    fill_in "Name", with: "Chicken"
    fill_in "Price", with: "5.54"
    fill_in "Photo url", with: "http://www.example.com/yolo.jpg"
    click_button "Create Taco"

    assert_content page, "Taco Created!"
    taco = Taco.find_by name: "Chicken"
    assert taco, "Taco should have existed after filling out form"

    assert_equal "jwo", taco.user.username

  end

  test "Can update a taco" do
    sign_in_user

    visit root_path
    click_link "Al Pastor"
    # on detail page
    click_link "Update Taco"

    fill_in "Name", with: "Chicken"
    fill_in "Price", with: "5.54"
    fill_in "Photo url", with: "http://www.example.com/yolo.jpg"
    click_button "Update Taco"

    assert_content page, "Taco Updated!"
    taco = Taco.find_by name: "Chicken"
    assert_equal "Chicken", taco.name
    assert_equal 5.54, taco.price
    assert_equal "http://www.example.com/yolo.jpg", taco.photo_url

  end

  test "Can Delete a Taco" do
    sign_in_user

    visit root_path
    click_link "Al Pastor"
    # on detail page
    click_link "Delete Taco"
    # 1. test the database
    # 2. test the view
    visit root_path

    # test db
    taco = Taco.find_by name: "Al Pastor"
    refute taco, "Taco should not exit"

    assert_equal false, Taco.where(name: 'Al Pastor').exists?

    # test view
    refute_content page, "Al Pastor"

  end

  def sign_in_user
    visit root_path
    click_link "New Taco"
    fill_in "Username", with: "jwo"
    fill_in "Password", with: "12345678"
    click_button "Sign In"
  end

end
