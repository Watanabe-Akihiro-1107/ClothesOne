class InquiryMailer < ApplicationMailer
	def send_mail(inquiry)
	  @inquiry = inquiry
	  mail(
	    from: 'answer.is.near.2@gmail.com',
	    to:   'answer.is.near.2@gmail.com',
	    subject: 'お問い合わせ通知'
	  )
	end
end
