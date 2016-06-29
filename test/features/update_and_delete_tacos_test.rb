require "test_helper"

class UpdateAndDeleteTacosTest < Capybara::Rails::TestCase


  setup do
    Taco.create! name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
  end

  test "Can update a taco" do
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


end
