class Staff < ApplicationRecord
  validates :nickname, presence: true, uniqueness: { scope: :user }

  belongs_to :user
end
