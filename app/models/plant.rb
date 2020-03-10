class Plant < ApplicationRecord
  belongs_to :grow
  belongs_to :user

  validates :name, presence: true
end
