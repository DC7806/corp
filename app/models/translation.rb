class Translation < ApplicationRecord
  def self.select_key(key)
    where(key: key)
  end
end
