class PaymentNotifications << ActionMailer::Base
	default from: 'club.berrendo@gmail.com', to: { User.pluck(:email) }

	def payment_confirmation(user)
    @user = user
    # I am overriding the 'to' default
    mail(to: @user.email, subject: 'Confirmación de Pago')
  end
end
