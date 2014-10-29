class AddSequenceNumToRoamImages < ActiveRecord::Migration
  def change
    add_column :roam_images, :sequence_num, :integer, null: false, default: 0
  end
end
