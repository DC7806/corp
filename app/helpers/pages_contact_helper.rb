module PagesContactHelper

  def frontend_notice_msg
    if flash.present?
      flash.each do |type, msg|
        alert_class = case type.to_sym
                      when :notice then 'msg-sent'
                      when :alert  then 'msg-failed'
                      end
        return  content_tag :div, id: 'notification', class: "text-center msg #{alert_class}" do
                  content_tag :p, msg, class: 'py-xs-0'
                end
      end
    end  
  end


end