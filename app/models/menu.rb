class Menu < ApplicationRecord
  validates :menu_name, presence: true, uniqueness: { scope: :user }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }

  belongs_to :user
end
