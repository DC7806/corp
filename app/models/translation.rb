class Translation < ApplicationRecord
    
  # search
  def self.search query
    # better ways?
    obj = self.where( "key LIKE ? OR LOWER(value) LIKE ?", 
                      "%#{query.downcase}%", "%#{query.downcase}%")
    where(key: [obj.pluck(:key)])
  end

end
