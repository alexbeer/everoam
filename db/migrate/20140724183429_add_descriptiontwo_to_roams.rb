class AddDescriptiontwoToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptiontwo, :string
  end
end
