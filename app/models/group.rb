class Group < ApplicationRecord
  belongs_to :user
  has_many :grow_groups, dependent: :destroy
  has_many :grows, through: :grow_groups
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
