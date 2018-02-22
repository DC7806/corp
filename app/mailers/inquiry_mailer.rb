class InquiryMailer < ApplicationMailer
  # notify corp user
  def inquiry_notification(inquiry)
    @inquiry = inquiry
    mail to: 'dachang.dev@gmail.com', subject: 'New Inquiry'
  end

  # auto reply to users
  def inquiry_auto_reply(inquiry)
    @inquiry = inquiry
    mail to: @inquiry.email, subject: 'Thank You For Reaching Out'
  end

end
