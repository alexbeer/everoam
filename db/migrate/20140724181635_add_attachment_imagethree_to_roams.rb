class AddAttachmentImagethreeToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imagethree
    end
  end

  def self.down
    drop_attached_file :roams, :imagethree
  end
end
