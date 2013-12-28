class Order < ActiveRecord::Base

	# has_one :restaurant, :through => :restaurant

  attr_accessible :organization, :restaurant, :attendees, :event_name, :contact_name, :contact_phone, :contact_email, :other_info, :date


end
