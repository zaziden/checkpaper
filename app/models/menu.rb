class Menu < ApplicationRecord
  validates :menu_name, presence: true

  belongs_to :user
end
