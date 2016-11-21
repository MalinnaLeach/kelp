
class Restaurant < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1500 }
  validates :user, presence: true

  has_many :reviews, dependent: :destroy
  belongs_to :user

  mount_uploader :image, ImageUploader

  def average_rating
    self.reviews.count == 0 ? "No ratings yet" : self.reviews.average(:rating).round
  end


end
