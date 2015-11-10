class MenuItemsController < ApplicationController
	def new
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id])
		@menu_item = @menu_section.menu_items.build
	end

	def edit
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id])
		@menu_item = @menu_section.menu_items.find(params[:id])
	end

	def create
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id])
		@menu_item = @menu_section.menu_items.create(menu_item_params)
		redirect_to store_menu_section_path(@store, @menu_section)
	end

	def update
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id])
		@menu_item = @menu_section.menu_items.find(params[:id])

		if @menu_item.update(menu_item_params)
			redirect_to store_menu_section_path(@store, @menu_section)
		else
			render 'edit'
		end
	end
	
	def destroy
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:menu_section_id])
		@menu_item = @menu_section.menu_items.find(params[:id])
		@menu_item.destroy
		redirect_to store_menu_section_path(@store, @menu_section)
	end
	
	private
		def menu_item_params
			params.require(:menu_item).permit(:name, :description, :price, :unit_id)
		end
end
