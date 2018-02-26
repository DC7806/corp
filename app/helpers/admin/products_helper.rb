module Admin::ProductsHelper

  def checkbox(model)
    collection_check_boxes(:admin_product, :"#{model.name.underscore}_ids", model.all, :id, :name) do |b|
      b.label class: "btn btn-default btn-checkbox" do
      (b.check_box)+
      (content_tag :span, b.text)
      end
    end
  end

  def product_image(f, locale, admin_product)
    if action_name == 'new'
      f.fields_for :images do |img|
        ( content_tag :div, class: 'form-group' do
            img.text_field :lang, value: locale.to_s, hidden: true
          end ) + 
        ( content_tag :div, class: 'form-group' do
          ( img.label :image_src, "產品圖片"  ) +
          ( img.file_field :src, class: "dropify" )
          end)  + 
        ( content_tag :div, class: 'form-group' do
          ( img.label :image_alt, "圖片說明文字" ) +
          ( img.text_field :alt, placeholder: "預設：品名", class: "form-control"  )
            end )
      end
    elsif action_name == 'edit'
      f.fields_for :images, admin_product.images.lang_query(locale.to_s).first do |img|
        ( content_tag :div, class: 'form-group' do
          img.text_field :lang, value: locale.to_s, hidden: true
        end ) + 
        ( content_tag :div, class: 'form-group' do
        ( img.label :image_src, "產品圖片"  ) +
        ( img.file_field :src, "data-default-file": admin_product.images.lang_query(locale.to_s).first.src.url, class: "dropify" )
        end)  + 
      ( content_tag :div, class: 'form-group' do
        ( img.label :image_alt, "圖片說明文字" ) +
        ( img.text_field :alt, placeholder: "預設：品名", class: "form-control"  )
          end )
      end
    end
  end

  def product_document(f, locale, admin_product)
    if action_name == 'new'
      f.fields_for :documents do |doc|
        ( content_tag :div, class: 'form-group' do
            doc.text_field :lang, value: locale.to_s, hidden: true
          end ) + 
        ( content_tag :div, class: 'form-group' do
          ( doc.label :src, "說明文件"  ) +
          ( doc.file_field :src, class: "dropify" )
          end)
      end
    elsif action_name == 'edit'
      f.fields_for :documents, admin_product.documents.lang_query(locale.to_s).first do |doc|
        ( content_tag :div, class: 'form-group' do
          doc.text_field :lang, value: locale.to_s, hidden: true
        end ) + 
        ( content_tag :div, class: 'form-group' do
        ( doc.label :src, "說明文件"  ) +
        ( doc.file_field :src, "data-default-file": admin_product.documents.lang_query(locale.to_s).first.src.url, class: "dropify" )
        end)
      end
    end
  end

end