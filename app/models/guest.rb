class Guest < ApplicationRecord
  validates :guest_name, presence: true, uniqueness: { scope: :user },length: { in: 1..10 }
  validates :gender, presence: true

  belongs_to :user
end
