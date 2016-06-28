require "test_helper"

class CanViewTacoDetailPageTest < Capybara::Rails::TestCase

  setup do
    Taco.create! name: "Al Pastor", price: 5.65, photo_url: "http://www.seriouseats.com/recipes/20120501-204377-tacos-al-pastor-step-8.jpg"
  end

  test "Can view detail" do
    visit root_path
    click_link "Al Pastor"
    assert_content page, "Al Pastor"
    assert_content page, 5.65
  end

end
