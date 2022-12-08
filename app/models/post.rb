class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  enum evaluation: {worst:1, bad:2, nb:3, good:4, best:5}
  validates :body, presence: true
  validates :waste, presence: true
  validates :evaluation, presence: true

  def liked_by?(user)
   likes.exists?(user_id: user.id)
  end
end
