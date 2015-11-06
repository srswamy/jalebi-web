class MenuSectionsController < ApplicationController

	def new 
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.build
	end

	def show
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:id])
	end

	def edit
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:id])
	end

	def create
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.create(menu_section_params)
		redirect_to store_path(@store)
	end

	def update
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:id])
		
		if @menu_section.update(menu_section_params)
			redirect_to store_path(@store)
		else
			render 'edit'
		end
	end

	def destroy
		@store = Store.find(params[:store_id])
		@menu_section = @store.menu_sections.find(params[:id])
		@menu_section.destroy
		redirect_to store_path(@store)
	end

	private 
		def menu_section_params
			params.require(:menu_section).permit(:name)
		end
end
