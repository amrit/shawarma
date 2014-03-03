class OrderMailer < ActionMailer::Base
  default from: "a.ayalur@gmail.com"

  def order_confirmation(order)
  	@order = order
  	mail(to: "amrit@berkeley.edu", subject: "New Order!")
  end
end


