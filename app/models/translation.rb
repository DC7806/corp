class Translation < ApplicationRecord
  def self.group_by_key(key)
    where(key: key)
  end
end
