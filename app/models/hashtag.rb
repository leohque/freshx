class Hashtag < ApplicationRecord
  has_many :hashtag_posts, dependent: :destroy
  has_many :posts, through: :hashtag_posts

  validates :name, presence: true
end
