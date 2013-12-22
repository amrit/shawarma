class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string :name
    	t.string :cuisine
    	t.string :address
    	t.string :manager
    	t.string :phone_number
    	t.string :email
    	t.string :note

      t.timestamps
    end
  end
end
