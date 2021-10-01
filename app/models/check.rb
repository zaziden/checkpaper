class Check < ApplicationRecord
  acts_as_paranoid
  validates :menuname,  presence:true
  validates :menuprice, presence:true
  validates :menuallprice, presence:true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :cup,       presence:true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
  belongs_to :checkroom
end
