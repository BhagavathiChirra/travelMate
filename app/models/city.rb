class City < ApplicationRecord
  has_many :posts
  has_many :photos
end
