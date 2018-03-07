module ProductsHelper
  # set default image to en page if en image is nil
  def product_image locale, product
    if locale == :en 
      if product.images.where(lang: 'en').first.src.present?  
        image_tag product.images.where(lang: 'en').first.src.url, 
        alt: product.images.where(lang: 'en').first.alt
      else
        image_tag product.images.where(lang: 'zh-TW').first.src.url, 
        alt: product.images.where(lang: 'zh-TW').first.alt
      end
    elsif locale == :'zh-TW'
      image_tag product.images.where(lang: 'zh-TW').first.src.url, 
      alt: product.images.where(lang: 'zh-TW').first.alt
    end
  end
  # no output if document doesnt present
  def product_document locale
    if @product.documents.where(lang: locale).first.src.present?
      content_tag :a, href: @product.documents.where(lang: locale).first.src.url do
        fa_icon 'file 4x'
      end
    end
  end
  # nav tab shows only when attribute present
  def product_nav_tab tab
    yield tab if tab.present?
  end
  # content shows only when attribute present
  def product_content content
    yield(content.html_safe) if content.present?
  end

end