class AddDescriptionToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :description, :string
  end
end
