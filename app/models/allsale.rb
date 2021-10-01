class Allsale < ApplicationRecord
  acts_as_paranoid
  validates :allprice, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :checkstaff, presence: true
  validates :checkguest, presence: true
  validates :checkroom_id, uniqueness: true
  belongs_to :user
  belongs_to :checkroom
end
