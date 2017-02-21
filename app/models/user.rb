class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :my_tombs, class_name: "Tomb", foreign_key: "owner_id"
  # mytombs is the path for owners and the list for owners.
  has_many :tombs, through: :bookings
  # tombs is the path for occupants
  validates :name, presence: true
  validates :birth_date, presence: true

end
