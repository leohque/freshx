class Post < ApplicationRecord
  belongs_to :user
  belongs_to :plant, optional: true
  belongs_to :grow, optional: true
  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence :true
end
