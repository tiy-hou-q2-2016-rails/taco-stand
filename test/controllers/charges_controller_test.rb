require "test_helper"

class ChargesControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end

end
