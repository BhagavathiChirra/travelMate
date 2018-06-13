class Post < ApplicationRecord
  has_many :comments
  has_many :users, :through => :comments
  belongs_to :city, optional: true
  belongs_to :user, optional: true
  geocoded_by :address
  after_validation :geocode
end
