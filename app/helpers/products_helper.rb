module ProductsHelper
  # set default image to frontedn en page if en image is nil
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
        fa_icon 'file 3x'
      end
    end
  end

end