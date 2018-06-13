class User < ApplicationRecord
  has_secure_password
  has_many :comments
  # has_many :likes
  has_and_belongs_to_many :liked_posts, class_name: 'Post'

  has_many :posts
  has_many :comment_posts, through: :comments, source: :post
end
