class InquiryMailer < ApplicationMailer
  
  # notify corp user
  def inquiry_notification(inquiry)
    mailbox = YAML::load_file("#{Rails.root}/config/system.yml").fetch('email').fetch('contact_email')
    @inquiry = inquiry
    mail to: mailbox, subject: 'New Inquiry'
  end

  # auto reply to users
  def inquiry_auto_reply(inquiry)
    @inquiry = inquiry
    mail to: @inquiry.email, subject: 'Thank You For Reaching Out'
  end

end
