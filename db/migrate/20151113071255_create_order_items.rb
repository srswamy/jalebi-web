class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :menu_item, index: true, :null => false
      t.references :order, index: true, :null => false
      t.integer :quantity, :null => false

      t.timestamps null: false
    end
    add_foreign_key :order_items, :menu_items
    add_foreign_key :order_items, :orders
  end
end
