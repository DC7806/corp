class Inquiry < ApplicationRecord
  validates :name, :number, :email, :content, presence: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
end
