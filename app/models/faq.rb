class Faq < ApplicationRecord
  validates :lang, :question, :answer, presence: true
end