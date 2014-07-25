class AddDescriptioneightToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptioneight, :string
  end
end
