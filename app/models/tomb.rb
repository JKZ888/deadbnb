class Tomb < ApplicationRecord
  belongs_to :graveyard
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bookings
end
