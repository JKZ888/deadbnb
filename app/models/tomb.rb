class Tomb < ApplicationRecord
  belongs_to :graveyard
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  before_destroy :check_count_for_booking
  has_many :bookings
  validates :price, presence: true
  validates :name_tomb, uniqueness: true, presence: true
  has_attachment :picture_tomb
  private
  def check_count_for_booking
    unless owner.bookings.count > 0
        errors.add_to_base "The school must have at least one administrator"
    end
  end
end

