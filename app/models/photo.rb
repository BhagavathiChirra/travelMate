class Photo < ApplicationRecord
  belongs_to :city, optional: true
  
end
