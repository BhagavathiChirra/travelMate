class Post < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_many :comments
  has_many :users, :through => :comments
  belongs_to :city, optional: true
  belongs_to :user, optional: true
  has_and_belongs_to_many :liked_by, class_name: 'User'
end
