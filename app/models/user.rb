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


  has_one_attached :photo
  has_one_attached :banner

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
