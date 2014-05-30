class CreateOrderTickets < ActiveRecord::Migration
  def change
    create_table :order_tickets do |t|
      t.string :menu_id
      t.string :name
      t.string :email
      t.string :phone
      t.string :payment_type
      t.decimal :tip, :precision=>64, :scale=>12, :default => 0.00
      t.string :order_type
      t.decimal :sub_total, :precision=>64, :scale=>12, :default => 0.00
      t.decimal :total, :precision=>64, :scale=>12, :default => 0.00
      t.timestamps
    end
  end
end
