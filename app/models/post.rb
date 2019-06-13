class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validate :image_presence
  validates :title, presence: true

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
end
