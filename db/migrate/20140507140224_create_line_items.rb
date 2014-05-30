class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.string :order_ticket_id
      t.string :unique_id
      t.string :menu_section_id
      t.string :item_id
      t.string :name
      t.decimal :price, :precision=>64, :scale=>12, :default => 0.00
      t.string :note
      t.timestamps
    end
  end
end
