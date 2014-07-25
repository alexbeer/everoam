class AddLocationToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :location, :string
  end
end
