class AddDescriptiontenToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionten, :string
  end
end
