class GrowUser < ApplicationRecord
  belongs_to :grow
  has_many :users
end
