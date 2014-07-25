class AddAttachmentImagenineToRoams < ActiveRecord::Migration
  def self.up
    change_table :roams do |t|
      t.attachment :imagenine
    end
  end

  def self.down
    drop_attached_file :roams, :imagenine
  end
end
