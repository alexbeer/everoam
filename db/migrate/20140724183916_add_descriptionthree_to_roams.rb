class AddDescriptionthreeToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionthree, :string
  end
end
