class ChangeOrderQuantityToAttendees < ActiveRecord::Migration
	def change
		rename_column :orders, :quantity, :attendees
	end
end
