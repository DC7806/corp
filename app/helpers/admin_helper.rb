module AdminHelper
  
  def admin_index_image instance
    # case instance.class.name
    # when 'Admin::Product'
    #   image_tag instance.images.lang_query("zh-TW").first.src.url if instance.images.lang_query("zh-TW").first.src.present?
    # when 'Admin::Metum'
    #   image_tag instance.og_image if instance.og_image.present?
    # end
    if instance.class.name == 'Admin::Product'
      image_tag instance.images.lang_query("zh-TW").first.src.url if instance.images.lang_query("zh-TW").first.src.present?
    elsif instance.class.name == 'Admin::Metum'
      image_tag instance.og_image if instance.og_image.present?
    elsif instance.class.name == 'Admin::Achievement' || instance.class.name == 'Admin::AchievementCase'
      image_tag instance.image.src if instance.image.present?
    end
  end

  def admin_session
    if admin_user_signed_in?
      link_to 'Logout', destroy_admin_user_session_path, method: :delete, class: "btn btn-default btn-flat form-control"
    else
      link_to 'Login', new_admin_user_session_path, class: "btn btn-default btn-flat form-control"
    end
  end

  def notice_msg
    if flash.present?
      flash.each do |type, msg|
        alert_class = case type.to_sym
                      when :notice then 'alert-info'
                      when :alert  then 'alert-danger'
                      end
        return  content_tag :div, class: "alert #{alert_class}" do
                (button_tag type: "button", class: "close", data: {dismiss: "alert"} do
                  content_tag :span, data: {hidden: true} do 
                    "&times;".html_safe
                  end
                end) + msg
               end
      end
    end  
  end

  def highlight_state instance
    case instance.is_highlight?
    when true then '精選'
    when false then '一般'
    end
  end

end