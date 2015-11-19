class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 10, scale: 2, :null => false
      t.decimal :tax, precision: 10, scale: 2
      t.decimal :shipping, precision: 10, scale: 2
      t.decimal :total, precision: 10, scale: 2, :null => false
      t.references :order_status, index: true, :null => false

      t.timestamps null: false
    end
    add_foreign_key :orders, :order_statuses
  end
end
