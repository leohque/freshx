class HashtagPost < ApplicationRecord
  belongs_to :hashtag
  belongs_to :post
end
