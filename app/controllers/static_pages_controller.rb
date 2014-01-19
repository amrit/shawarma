class StaticPagesController < ApplicationController
	def index
	end

	def about
	end

	def contact
		@message = Message.new
	end

end
