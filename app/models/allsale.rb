class Allsale < ApplicationRecord
  acts_as_paranoid
  validates :allprice, presence: true
  validates :checkstaff, presence: true

  belongs_to :user
  belongs_to :checkroom
end
