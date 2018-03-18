class RegistrationsController < Devise::RegistrationsController

  before_action :two_user_registered?, only: [:new, :create]
  
  protected

  def two_user_registered?
    if AdminUser.count > 2
      redirect_to root_path
    end  
    # if ((User.count == 2) & (user_signed_in?))
    #   redirect_to root_path
    # elsif User.count == 2
    #   redirect_to new_user_session_path
    # end  
  end

end