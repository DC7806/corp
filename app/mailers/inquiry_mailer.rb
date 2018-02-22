class InquiryMailer < ApplicationMailer
  def inquiry_notification(inquiry)
    @inquiry = inquiry
    mail to: 'dachang.dev@gmail.com', subject: 'New Inquiry'
  end
  def inquiry_auto_reply(inquiry)
    @inquiry = inquiry
    mail to: @inquiry.email, subject: 'Thank You For Reaching Out'
  end
end
