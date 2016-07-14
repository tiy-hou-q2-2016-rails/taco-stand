class Taco < ActiveRecord::Base

  belongs_to :user
  validates :price, numericality: {less_than_or_equal_to: 7}
  validates :user, presence: true
  validates :photo_url, presence: true
  validates :name, presence: true
  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :country, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  def full_address
    [address_line_1, city, state, zip, country].join(",").gsub(" ", "+")
  end

  def lat
    latitude
  end

  def lng
    longitude
  end

  def title
    name
  end
end
