class OrderMailer < ActionMailer::Base
  default from: "no-reply@shawarma.com"

  def order_confirmation(order)
  	@order = order
  	mail(to: "slicekick@gmail.com", subject: "New Order!")
  end
end
