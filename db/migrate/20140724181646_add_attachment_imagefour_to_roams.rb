class AddAttachmentImagefourToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imagefour
    end
  end

  def self.down
    drop_attached_file :roams, :imagefour
  end
end
