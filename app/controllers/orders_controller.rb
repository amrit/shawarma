class OrdersController < ApplicationController

	def new
		@order = Order.new
		@restaurants = Restaurant.all
	end

	def create
    @order = Order.new(params[:order])
    @order.save
    respond_to do |format|
			format.js {render :js => "alert('Thanks');"}
		end
	end

end
