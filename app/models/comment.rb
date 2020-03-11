class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  after_commit :create_hashtags

  def extract_name_hashtags
    content.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end

  def create_hashtags
    extract_name_hashtags.each do |name|
      hashtag = Hashtag.find_or_create_by(name: name)
      hashtags << hashtag unless hashtags.include?(hashtag)
    end
  end

  def content_with_links
    new_content = content
    content.to_s.scan(/#\w+/).each do|hashtag|
      new_content.gsub!(hashtag, "<a href='/posts?hashtag=#{hashtag.gsub("#", "")}'>#{hashtag}</a>")
    end
    new_content
  end

end
