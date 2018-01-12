module Admin::ProductsHelper
  def categories_collection(model)
    collection_check_boxes(:admin_product, :"#{model.name.underscore}_ids", model.all, :id, :name) do |b|
      (content_tag :span, b.label)+
      (content_tag :span, b.check_box)
    end
  end
end
