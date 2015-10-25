class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.references :menu_section, index: true
      t.integer :price
      t.references :unit, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_items, :menu_sections
    add_foreign_key :menu_items, :units
  end
end
