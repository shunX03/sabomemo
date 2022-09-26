class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :profile_image
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no.user.png'
  end
end
