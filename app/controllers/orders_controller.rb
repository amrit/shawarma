class OrdersController < ApplicationController

	def new
		@order = Order.new
		@restaurants = Restaurant.all
	end

	def create
    @order = Order.new(params[:order])
    if @order.save
	    respond_to do |format|
				format.js {render :js => "alert('Thanks');"}
			end
			OrderMailer.order_confirmation(@order).deliver
		end
	end

end
