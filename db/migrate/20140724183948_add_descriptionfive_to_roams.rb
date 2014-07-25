class AddDescriptionfiveToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionfive, :string
  end
end
