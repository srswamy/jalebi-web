class SetStoreIdToNotNull < ActiveRecord::Migration
  def change
	change_column_null :menu_sections, :store_id, false
  end
end
