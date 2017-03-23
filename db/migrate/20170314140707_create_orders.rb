class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :order_status_id
      t.string :restaurantName, :limit => 50, :null => false
      t.decimal :totalPrice, :precision => 7, :scale => 2
      t.timestamps null: false
    end
    add_index("orders","order_status_id")
  end
end
