class Post < ApplicationRecord
  has_many :comments
  has_many :users, :through => :comments
  belongs_to :city, optional: true
  
end
