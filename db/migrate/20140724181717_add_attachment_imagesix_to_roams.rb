class AddAttachmentImagesixToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imagesix
    end
  end

  def self.down
    drop_attached_file :roams, :imagesix
  end
end
