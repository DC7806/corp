class Translation < ApplicationRecord

  def self.group_by_key(key)
    where(key: key)
  end
    
  # search
  def self.search query
    # better ways?
    # eng value not working
    obj = self.where("key LIKE ? OR LOWER(value) LIKE ?", 
                    "%#{query.downcase}%", "%#{query.downcase}%")
    where(key: [obj.pluck(:key)])
  end


end
