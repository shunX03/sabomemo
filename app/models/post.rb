class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  enum evaluation: {worst:1, bad:2, nb:3, good:4, best:5}
  validates :body, presence: true
  validates :waste, presence: true
  validates :evaluation, presence: true

  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
  def liked_by?(user)
   likes.exists?(user_id: user.id)
  end
end
