class RoamImage < ActiveRecord::Base
  belongs_to :roam

  validates :sequence_num, numericality: true
end
