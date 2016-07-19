class Taco < ActiveRecord::Base

  belongs_to :user
  validates :price, numericality: {less_than_or_equal_to: 7}
  validates :user, presence: true
  validates :photo_url, presence: true
  validates :name, presence: true

  scope :timeline_for_user, -> (user) {
    user_ids = user.following_users.pluck(:id)
    user_ids.push(user.id)
    where(user_id: user_ids).order("created_at DESC")
  }

  def price_in_cents
    (price * 100).to_i
  end
end
