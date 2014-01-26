class OrdersController < ApplicationController

	def new
		@order = Order.new
		@restaurants = Restaurant.all
	end

	def create
    @order = Order.new(params[:order])
    if @order.save
    	respond_to do |format|
				format.js {render :status => 200, :nothing => true}
			end
			OrderMailer.order_confirmation(@order).deliver
	  end
	end

end
