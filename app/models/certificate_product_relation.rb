class CertificateProductRelation < ApplicationRecord
  belongs_to :certificate
  belongs_to :product
end
