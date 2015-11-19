module Api
	module V1	
		class MenuItemsController < ApplicationController
			def index
				@store = Store.find(params[:store_id])
				@menu_section = @store.menu_sections.find(params[:menu_section_id]);
				@menu_items = @menu_section.menu_items
				render :json => @menu_items.to_json(
						:include => :unit
						)
			end

			def show
				@store = Store.find(params[:store_id])
				@menu_section = @store.menu_sections.find(params[:menu_section_id]);
				@menu_item = @menu_section.menu_items.find(params[:id])
				render :json => @menu_item.to_json(
						:include => :unit 
						)
			end
		end
	end
end
