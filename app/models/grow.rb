class Grow < ApplicationRecord
  belongs_to :user

  has_many :grow_users, dependent: :destroy

  has_many :plants, dependent: :destroy
  has_many :group_grows, dependent: :destroy
  has_many :groups, through: :group_grows

  has_one_attached :photo


  validates :name, presence: true

  validates :location, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
