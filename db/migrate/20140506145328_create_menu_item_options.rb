class CreateMenuItemOptions < ActiveRecord::Migration
  def change
    create_table :menu_item_options do |t|
      t.integer :menu_item_option_section_id
      t.string :description
      t.decimal :price, :precision=>64, :scale=>12, :default => 0.00
      t.timestamps
    end
  end
end
