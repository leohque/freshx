class Post < ApplicationRecord
  belongs_to :user
  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :content, presence :true
end
