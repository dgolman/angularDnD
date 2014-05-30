class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.integer :menu_section_id
      t.string :title
      t.decimal :price, :precision=>64, :scale=>12, :default => 0.00
      t.text :description

      t.timestamps
    end
  end
end
