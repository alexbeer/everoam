class AddAttachmentImagetwoToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imagetwo
    end
  end

  def self.down
    drop_attached_file :roams, :imagetwo
  end
end
