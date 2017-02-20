class Booking < ApplicationRecord
  belongs_to :tomb
  belongs_to :user
end
