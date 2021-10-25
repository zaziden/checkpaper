class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #:timeoutable
  
  validates :name, presence: true

  has_many :menus
  has_many :guests
  has_many :staffs
  has_many :checkrooms
  has_many :checks
  has_many :allsales
  has_many :shifts
end
