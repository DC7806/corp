class Translation < ApplicationRecord
  
  def self.group_by_key(key)
    where(key: key)
  end
    
  # search
  # better ways?
  def self.search query
    obj = self.where("key LIKE ? OR lower(value) LIKE ?", 
                    "%#{query.downcase}%", "%#{query.downcase}%")
    where(key: [obj.pluck(:key)])
  end


end
