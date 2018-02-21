class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if verify_recaptcha(model: @inquiry) && @inquiry.save
      # send mail
      redirect_back(fallback_location: request.referrer)
    else
      ## how to kept input info acting like render :new??
      flash[:alert] = 'something went wrong'
      ## to do: front end error messages
      redirect_back(fallback_location: request.referrer)

    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :number, :email, :content)
  end

end
