class AddDescriptionsixToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionsix, :string
  end
end
