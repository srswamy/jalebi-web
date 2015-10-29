module Api
	module V1
		class MenuSectionsController < ApplicationController
			def index
				@store = Store.find(params[:store_id])
				render json: @store.menu_sections
			end

			def show
				@store = Store.find(params[:store_id])
				render json: @store.menu_sections.find(params[:id])
			end
		end
	end
end
