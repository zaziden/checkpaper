class Allsale < ApplicationRecord
  acts_as_paranoid
  validates :allprice, presence: true

  belongs_to :user
  belongs_to :checkroom
end
