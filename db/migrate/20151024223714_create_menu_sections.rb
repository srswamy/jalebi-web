class CreateMenuSections < ActiveRecord::Migration
  def change
    create_table :menu_sections do |t|
      t.string :name
      t.references :store, index: true

      t.timestamps null: false
    end
    add_foreign_key :menu_sections, :stores
  end
end
