class RoamImage < ActiveRecord::Base
  belongs_to :roam
  validates :image_large_url, presence: true
  validates :image_medium_url, presence: true
  validates :image_thumb_url, presence: true
end
