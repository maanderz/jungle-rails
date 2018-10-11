class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def confirmation_email(current_user, order)
    @order = order
    @current_user = current_user
    mail(to: @current_user.email, subject: @order.id)
  end
end
