module AdminHelper
  def admin_index_image(instance)
    case instance.class.name
    when 'Admin::Product'
      image_tag instance.images.lang_query("zh-TW").first.src.url, style: "width:100%" if instance.images.lang_query("zh-TW").first.src.present?
    when 'Admin::Metum'
      image_tag instance.og_image, style: "width:100%" if instance.og_image.present?
    end
  end
end