class Checkroom < ApplicationRecord
  acts_as_paranoid
  validates :room_name, presence: true
  validates :how_many, presence: true

  belongs_to :user
  has_many   :checks, dependent: :destroy
  has_one    :allsale, dependent: :destroy
end
