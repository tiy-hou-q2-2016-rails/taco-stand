require 'test_helper'

class TacoTest < ActiveSupport::TestCase

  test "tacos should be cheap" do

    taco = Taco.new
    taco.price = 8.50
    taco.valid?
    assert_equal true, taco.errors[:price].any?, "Should have error on price"

  end

  test "tacos cheap tacos rule" do

    taco = Taco.new
    taco.price = 5.50
    taco.valid?
    assert_equal false, taco.errors[:price].any?, "Should not have error on price"

  end
end
