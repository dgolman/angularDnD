class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :restaurant_id
      t.string :name
      t.boolean :active	
      t.timestamps
    end
  end
end
