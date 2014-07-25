class AddDescriptionfourToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionfour, :string
  end
end
