class AddAttachmentImageToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :roams, :image
  end
end
