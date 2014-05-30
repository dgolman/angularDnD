class AdminController < ApplicationController
	before_action :authenticate_user!
	respond_to :json
	
	def restaurants
		respond_with current_user.restaurants
	end

	def create_restaurant
		restaurant = current_user.restaurants.build(restaurant_params)
		if restaurant.save
			respond_with restaurant do |format|
				format.json {render json: restaurant}
			end
		end
	end

	private 
	
	def restaurant_params
		params.require(:restaurant).permit(:name)
	end


end
