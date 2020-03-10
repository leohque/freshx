class Post < ApplicationRecord
  belongs_to :user
  belongs_to :plant, optional: true
  belongs_to :grow, optional: true
  has_many :hashtag_posts, dependent: :destroy
  has_many :hashtags, through: :hashtag_posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many_attached :photos
  # validates :photos, attached: true, content_type: [:png, :jpg, :jpeg]

  validates :content, presence: true
end
