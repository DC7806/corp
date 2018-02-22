class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    # for render template
    @contacts = YAML::load_file("#{Rails.root}/config/contacts.yml")
    @contacts_hq_zh = @contacts.slice('hq_zh')
    @contacts_hq_en = @contacts.slice('hq_en')
    
    @inquiry = Inquiry.new(inquiry_params)
    if verify_recaptcha(model: @inquiry) && @inquiry.save
      # send mail
      InquiryMailer.inquiry_notification(@inquiry).deliver_now
      redirect_back(fallback_location: request.referrer)
      InquiryMailer.inquiry_auto_reply(@inquiry).deliver_now
    else
      flash[:alert] = 'something went wrong'
      render template: 'pages/contact'
      ## to do: front end error messages
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :number, :email, :content)
  end

end
