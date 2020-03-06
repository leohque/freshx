class Grow < ApplicationRecord
  belongs_to :user
  has_many :grow_users, dependent: :destroy
  has_many :plants, dependent: :destroy
  has_many :grow_groups, dependent: :destroy
  has_many :groups, through: :grow_groups
  has_many_attached :photos
end
