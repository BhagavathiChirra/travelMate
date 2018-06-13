class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  
  has_many :comments
  has_many :users, :through => :comments
  belongs_to :city, optional: true
  belongs_to :user, optional: true

end
