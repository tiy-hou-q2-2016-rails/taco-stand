require "test_helper"

class CreateTacoTest < Capybara::Rails::TestCase

  test "Creating Taco" do

    visit root_path
    click_link "New Taco"
    fill_in "Name", with: "Chicken"
    fill_in "Price", with: "5.54"
    fill_in "Photo url", with: "http://www.example.com/yolo.jpg"
    click_button "Create Taco"

    assert_content page, "Taco Created!"
    taco = Taco.find_by name: "Chicken"
    assert taco, "Taco should have existed after filling out form"

  end

end
