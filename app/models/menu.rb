class Menu < ApplicationRecord
  validates :menu_name, presence: true, uniqueness: { scope: :user }

  belongs_to :user
end
