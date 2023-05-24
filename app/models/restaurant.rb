class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }

  def avg_rating
    rating = reviews.map do |review|
      review.rating
    end
    rating.sum / rating.size
  end
end
