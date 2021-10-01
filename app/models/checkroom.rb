class Checkroom < ApplicationRecord
  acts_as_paranoid
  validates :room_name, presence: true
  validates :how_many, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  has_many   :checks, dependent: :destroy
  has_one    :allsale, dependent: :destroy
end
