class Graveyard < ApplicationRecord
  has_many :tombs
  validates :city, presence: true
  validates :nb_places, presence: true
end
