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

  after_commit :create_hashtags


  # def self.with_hashtags
  #   joins(:hashtags)
  # end

  def extract_name_hashtags
    content.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

  def create_hashtags
    extract_name_hashtags.each do |name|
      hashtags.find_or_create_by(name: name)
    end
  end
end

# current_user.posts.with_hashtags
