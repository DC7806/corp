class ApplicationRecord < ActiveRecord::Base
  
  self.abstract_class = true

  # overwrite default_url_options
  include LangQuery

  # product search
  def self.search query
    # better ways?
    obj = Mobility::ActiveRecord::StringTranslation
          .where(translatable_type: 'Product', locale: I18n.locale.to_s, key: 'name')
          .where("value LIKE ?", "%#{query.downcase}%")
    where(id: [obj.pluck(:translatable_id)])
  end

end
