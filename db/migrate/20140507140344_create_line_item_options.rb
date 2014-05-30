class CreateLineItemOptions < ActiveRecord::Migration
  def change
    create_table :line_item_options do |t|
      t.string :line_item_id
      t.string :parent_id
      t.string :description
      t.decimal :price, :precision=>64, :scale=>12, :default => 0.00
      t.timestamps
    end
  end
end
