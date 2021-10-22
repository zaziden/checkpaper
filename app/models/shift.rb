class Shift < ApplicationRecord
  validates :shift_staff, presence: true
  belongs_to :user
end
