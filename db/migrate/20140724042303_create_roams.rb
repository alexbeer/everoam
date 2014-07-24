class CreateRoams < ActiveRecord::Migration
  def change
    create_table :roams do |t|
      t.string :title

      t.timestamps
    end
  end
end
