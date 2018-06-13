class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes
  # # like the comment
  # def like(user)
  #   likes << Like.new(user: user)
  # end
  #
  # # unlike the comment
  # def unlike(user)
  #   likes.where(user_id: user.id).first.destroy
  # end

end
