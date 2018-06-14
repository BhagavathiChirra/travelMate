class Photo < ApplicationRecord
  belongs_to :city, optional: true
  belongs_to :post, optional: true
end
