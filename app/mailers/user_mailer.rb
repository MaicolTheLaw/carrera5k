class UserMailer < ApplicationMailer
	default from: "carwashservicearkus@gmail.com"

	def breakfast_report(email)
    # @breakfasts_sold = breakfast_count
    # @total_money     = breakfast_count * 40
    # @report = Breakfast.breakfast_mailer_hash(breakfasts)
    # puts "#{@report.inspect}!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!112222222"
    # puts "#{breakfasts.inspect}333333333333333333333333333333333333333333333"
    mail(to: email, subject: 'Reporte de desayunos')
  end

end
