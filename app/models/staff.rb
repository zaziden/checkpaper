class Staff < ApplicationRecord
  validates :nickname, presence: true

  belongs_to :user
end
