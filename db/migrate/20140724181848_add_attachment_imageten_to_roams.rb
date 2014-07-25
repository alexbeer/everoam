class AddAttachmentImagetenToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imageten
    end
  end

  def self.down
    drop_attached_file :roams, :imageten
  end
end
