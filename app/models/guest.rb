class Guest < ApplicationRecord
  validates :guest_name, presence: true, uniqueness: { scope: :user },length: { in: 1..10 }
  belongs_to :user
end
