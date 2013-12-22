class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
    	t.string :organization
    	t.string :requested_business
    	t.string :quantity
    	t.string :event_name
    	t.string :contact_name
    	t.string :contact_phone
    	t.string :contact_email
    	t.text :other_info

      t.timestamps
    end
  end
end
