class Tomb < ApplicationRecord
  belongs_to :graveyard
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings
  validates :price, presence: true
  validates :name_tomb, uniqueness: true, presence: true
  has_attachment :picture_tomb
end
