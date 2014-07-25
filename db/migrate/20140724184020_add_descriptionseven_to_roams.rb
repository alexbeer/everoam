class AddDescriptionsevenToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionseven, :string
  end
end
