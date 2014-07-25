class AddAttachmentImagefiveToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imagefive
    end
  end

  def self.down
    drop_attached_file :roams, :imagefive
  end
end
