module ProductsHelper

  def product_image locale, product
    # not working
    # if locale == 'en' 
    #   if @product.images.where(lang: 'en').first.src.present?  
    #     image_tag @product.images.where(lang: 'en').first.src.url, 
    #     alt: @product.images.where(lang: 'en').first.alt
    #   else
    #     image_tag @product.images.where(lang: 'zh-TW').first.src.url, 
    #     alt: @product.images.where(lang: 'zh-TW').first.alt
    #   end
    # elsif locale == 'zh-TW'
    #   image_tag @product.images.where(lang: 'zh-TW').first.src.url, 
    #   alt: @product.images.where(lang: 'zh-TW').first.alt
    # end
    if product.images.where(lang: locale).first.src.present?  
      image_tag product.images.where(lang: locale).first.src.url, 
      alt: product.images.where(lang: locale).first.alt
    end
  end

  def product_document locale
    if @product.documents.where(lang: locale).first.src.present?
      content_tag :a, href: @product.documents.where(lang: locale).first.src.url do
        fa_icon 'file 4x'
      end
    end
  end

end