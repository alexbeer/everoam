class Roam < ActiveRecord::Base
	belongs_to :user

	has_many :images, class_name: 'RoamImage', dependent: :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

 	 default_scope -> { order('created_at DESC') }
  	validates :user_id, presence: true

	has_attached_file :image, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	validates :title, presence: true


def self.search(query)
  where("title like ?", "%#{query}%") 
end


end
