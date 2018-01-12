module Admin::ProductsHelper
  def categories_collection
    collection_check_boxes(:admin_product, :category_ids, Category.all, :id, :name) do |b|
      (content_tag :span, b.label)+
      (content_tag :span, b.check_box)
    end
  end
end
