class ChangeRoamImages < ActiveRecord::Migration
  def up
    remove_column :roam_images, :image_file_name
    remove_column :roam_images, :image_content_type
    remove_column :roam_images, :image_file_size
    remove_column :roam_images, :image_updated_at

    add_column :roam_images, :image_large_url, :string
    add_column :roam_images, :image_medium_url, :string
    add_column :roam_images, :image_thumb_url, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
