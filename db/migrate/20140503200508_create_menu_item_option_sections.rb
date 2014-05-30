class CreateMenuItemOptionSections < ActiveRecord::Migration
  def change
    create_table :menu_item_option_sections do |t|
      t.integer :menu_item_id
      t.string :description
      t.integer :radiobuttons
      t.timestamps
    end
  end
end
