class Restaurant < ActiveRecord::Base

	has_many :orders

  attr_accessible :name, :cuisine, :address, :manager, :phone_number, :email, :note

  validates_presence_of :name, :address 

end
