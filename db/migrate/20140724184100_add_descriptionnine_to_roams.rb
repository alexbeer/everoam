class AddDescriptionnineToRoams < ActiveRecord::Migration
  def change
    add_column :roams, :descriptionnine, :string
  end
end
