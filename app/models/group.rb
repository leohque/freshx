class Group < ApplicationRecord
  belongs_to :user
  has_many :group_grows, dependent: :destroy
  has_many :grows, through: :group_grows
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

end
