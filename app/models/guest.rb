class Guest < ApplicationRecord
  validates :guest_name, presence: true, uniqueness: { scope: :user }
  validates :gender, presence: true

  belongs_to :user
end
