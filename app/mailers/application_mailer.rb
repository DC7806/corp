class ApplicationMailer < ActionMailer::Base
  default from: Settings.site_name
  layout 'mailer'
end