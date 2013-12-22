class RestaurantsController < ApplicationController

	def new
		@restaurant = Restaurant.new
	end

	def show
		@restaurants = Resturant.all
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end


end
