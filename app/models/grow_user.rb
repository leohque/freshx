class GrowUser < ApplicationRecord
  belongs_to :grow
  belongs_to :user
end
