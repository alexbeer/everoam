class CreateRoamImages < ActiveRecord::Migration
  def change
    create_table :roam_images do |t|
      t.references :roam
      t.attachment :image
      t.text :caption
    end
  end
end
