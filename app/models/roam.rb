class Roam < ActiveRecord::Base
	belongs_to :user

 	 default_scope -> { order('created_at DESC') }
  	validates :user_id, presence: true

	has_attached_file :image, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }
		validates :images, presence: true

	has_attached_file :imagetwo, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagethree, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagefour, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagefive, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagesix, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imageseven, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imageeight, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagenine, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imageten, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_many :images, class_name: 'RoamImage', dependent: :destroy
	accepts_nested_attributes_for :images, :allow_destroy => true

	def image_ids=(val)
		if val.is_a? String
			super val.split(',')
		else
			super val
		end
	end

end
