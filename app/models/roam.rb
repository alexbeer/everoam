class Roam < ActiveRecord::Base
	belongs_to :user

 	 default_scope -> { order('created_at DESC') }
  	validates :user_id, presence: true

	has_attached_file :image, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }
		validates :image, presence: true

	has_attached_file :imagetwo, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagethree, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagefour, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagefive, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagesix, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imageseven, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imageeight, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imagenine, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }


	has_attached_file :imageten, :styles => { :large => "800x600>", :medium => "300x300>", :thumb => "100x100>" }






end
