class Taco < ActiveRecord::Base

  validates :price, numericality: {less_than_or_equal_to: 7}
end
