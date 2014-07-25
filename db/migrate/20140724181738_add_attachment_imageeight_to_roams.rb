class AddAttachmentImageeightToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imageeight
    end
  end

  def self.down
    drop_attached_file :roams, :imageeight
  end
end
