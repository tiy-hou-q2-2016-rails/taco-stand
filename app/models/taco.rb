class Taco < ActiveRecord::Base

  belongs_to :user
  validates :price, numericality: {less_than_or_equal_to: 7}
  validates :user, presence: true
  validates :photo, presence: true
  validates :name, presence: true

  attachment :photo,  content_type: ["image/jpeg", "image/png", "image/gif"]
end
