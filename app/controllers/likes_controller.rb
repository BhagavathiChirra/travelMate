class LikesController < ApplicationController
  def update
    p = Post.find(params[:id])
    if @current_user.liked_posts.include?( p )
      # already in liked posts list, so remove
       @current_user.liked_posts.destroy( p )
       render json: { removed: true }

    else
      # not in liked posts yet, so add
      @current_user.liked_posts << p
      render json: { added: true }
    end



  end
end
