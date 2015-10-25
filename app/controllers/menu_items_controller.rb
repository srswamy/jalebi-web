class MenuItemsController < ApplicationController
	def index
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id]);
		render json: @menu_section.menu_items
	end

	def show
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id]);
		render json: @menu_section.menu_items.find(params[:id])
	end
end
