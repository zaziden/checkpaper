class Guest < ApplicationRecord
  validates :guest_name, presence: true
  validates :gender, presence: true

  belongs_to :user
end
