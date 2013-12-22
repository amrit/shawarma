class ChangeRequestedBusinessToRestaurantInOrders < ActiveRecord::Migration
  def up
  	remove_column :orders, :requested_business
  	add_column :orders, :restaurant, :string
  end

  def down
  	add_column :orders, :requested_business, :string
  	remove_column :orders, :restaurant
  end
end
