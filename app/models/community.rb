class Community < ApplicationRecord
  has_many :comments, dependent: :destroy

  def self.search(venue_year, venue_month, venue)
     where(["venue_year like? OR venue_month like? OR venue", "%#{venue_year}%", "%#{venue_month}%", "%#{venue}%"])
  end
end
