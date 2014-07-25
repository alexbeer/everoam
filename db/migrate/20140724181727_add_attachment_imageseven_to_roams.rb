class AddAttachmentImagesevenToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imageseven
    end
  end

  def self.down
    drop_attached_file :roams, :imageseven
  end
end
