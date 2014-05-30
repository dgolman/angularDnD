class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :user_id
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zipcode
      t.float :latitude
      t.float :longitude
      t.decimal :revenue, :precision=>64, :scale=>12, :default => 0.00 
      t.integer :orders, :default => 0
      t.string :subscription
      t.timestamps
    end
  end
end
