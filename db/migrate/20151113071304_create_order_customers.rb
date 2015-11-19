class CreateOrderCustomers < ActiveRecord::Migration
  def change
    create_table :order_customers do |t|
      t.references :order, index: true, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.integer :phone_number, :null => false
      t.text :address_line_1, :null => false
      t.text :address_line_2
      t.string :city, :null => false
      t.string :state, :null => false

      t.timestamps null: false
    end
    add_foreign_key :order_customers, :orders
  end
end
