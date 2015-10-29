module Api
	module V1
		class StoresController < ApplicationController
			def index
				render json: Store.all
			end

			def show
				render json: Store.find(params[:id])
			end
		end
	end
end
