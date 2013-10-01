class WardrobeItem < ActiveRecord::Base
  validates :garment, presence: true
end
