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
            img.text_field :lang, value: locale, hidden: true
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
      f.fields_for :images, admin_product.images.where(lang: locale) do |img|
        ( content_tag :div, class: 'form-group' do
          img.text_field :lang, value: locale, hidden: true
        end ) + 
        ( content_tag :div, class: 'form-group' do
        ( img.label :image_src, "產品圖片"  ) +
        ( img.file_field :src, "data-default-file": admin_product.images.where(lang: locale).first.src.url, class: "dropify" )
        end)  + 
      ( content_tag :div, class: 'form-group' do
        ( img.label :image_alt, "圖片說明文字" ) +
        ( img.text_field :alt, placeholder: "預設：品名", class: "form-control"  )
          end )
      end
    end
  end

  def index_product_image(product)
    if product.images.where(lang: "zh-TW").first.src.present?
      image_tag product.images.where(lang: "zh-TW").first.src.url, style: "width:100%" 
    end
  end

end

# <% if action_name == 'new' %>
#   <%= f.fields_for :images do |img| %>
#     <div class="form-group">
#       <%= img.text_field :lang, value: "zh-TW", hidden: true%>    
#     </div>
#     <div class="form-group">
#       <%= img.label :image_src_tw, "產品圖片_中文" %>
#       <%= img.file_field :src, class: "dropify" %>    
#     </div>
#     <div class="form-group">
#       <%= img.label :image_alt, "圖片說明文字_中文" %>
#       <%= img.text_field :alt, placeholder: "預設：品名", class: "form-control" %>  
#     </div>
#   <% end %>
#   <%= f.fields_for :images do |img| %>
#     <div class="form-group">
#       <%= img.text_field :lang, value: "en", hidden: true%>    
#     </div>
#     <div class="form-group">
#       <%= img.label :image_src_en, "產品圖片_英文" %>
#       <%= img.file_field :src, class: "dropify" %>    
#     </div>
#     <div class="form-group">
#       <%= img.label :image_alt, "圖片說明文字_英文" %>
#       <%= img.text_field :alt, placeholder: "預設：品名", class: "form-control" %>  
#     </div>
#   <% end %>
#   <% elsif action_name == 'edit' %>
#   <%= f.fields_for :images, admin_product.images.where(lang: "zh-TW") do |img| %> 
#     <div class="form-group">
#       <%= img.label :image_src, "產品圖片_中文"%>
#       <%= img.file_field :src, "data-default-file": admin_product.images.where(lang: "zh-TW").first.src.url, class: "dropify" %>    
#     </div>
#     <div class="form-group">
#       <%= img.label :image_alt, "圖片說明文字_中文" %>
#       <%= img.text_field :alt, placeholder: "預設：品名", class: "form-control" %> 
#     </div>
#   <% end %>
#   <%= f.fields_for :images, admin_product.images.where(lang: "en") do |img| %>
#     <div class="form-group">
#       <%= img.label :image_src, "產品圖片_英文" %>
#       <%= img.file_field :src, "data-default-file": admin_product.images.where(lang: "en").first.src.url, class: "dropify" %>    
#     </div>
#     <div class="form-group">
#       <%= img.label :image_alt, "圖片說明文字_英文" %>
#       <%= img.text_field :alt, placeholder: "預設：品名", class: "form-control" %>  
#     </div>
#   <% end %>
# <% end %>