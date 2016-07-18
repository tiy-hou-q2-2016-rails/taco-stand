require "test_helper"

class SharingControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end

end
