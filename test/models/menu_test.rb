require "test_helper"

class MenuTest < ActiveSupport::TestCase
  def menu
    @menu ||= Menu.new
  end

  def test_valid
    assert menu.valid?
  end
end
