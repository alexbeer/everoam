class RoamImage < ActiveRecord::Base
  belongs_to :roam
  has_attached_file :image, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }
  validates :image, presence: true

  def as_json(options = {})
    super.merge({ thumb_url: image.url(:thumb) })
  end
end
