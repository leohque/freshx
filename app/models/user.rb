class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: true
  validates :location, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :grow_users, dependent: :destroy
  has_many :participating_grows, through: :grow_users, source: :grow #rename association for distinguishing
  has_many :grows, dependent: :destroy
  has_many :plants, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :group_users, dependent: :destroy
  has_many :participating_groups, through: :group_users, source: :group #rename association for distinguishing
  has_many :groups, dependent: :destroy

  has_many :followings, dependent: :destroy
  has_many :followers, through: :followings

  has_many :followings_as_follower, class_name: "Following", foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followings_as_follower, source: :user

  has_one_attached :photo
  has_one_attached :banner

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # def is_following?(user)
  #   followed_users.include?(user)
  # end

  def following_record(user)
    followings_as_follower.find_by(user: user)
  end
end
