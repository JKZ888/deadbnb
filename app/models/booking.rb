class Booking < ApplicationRecord
  belongs_to :tomb
  belongs_to :user
  validates :duration_years, presence: true
  validates :nb_persons, presence: true
end
