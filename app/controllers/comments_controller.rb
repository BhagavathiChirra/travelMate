class CommentsController < ApplicationController
  def index
    @comments = Comment.where post_id: params[:id]
    render :json => @comments.as_json( :include => [ :user ])
  end

  def create
    comment = Comment.new content: params[:content], post_id: params[:post_id]
    comment.user = @current_user
    comment.save
    render json: comment.as_json( :include => [ :user ]), status: :created
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
  end

  # private
  # def comment_params
  #   # params.require(:content, :user_id, :post_id)
  #   params.require(:content).permit(:title, :image)
  #   # params = {:content => { :title => "a title", :image => "image"} }
  #
  # end
end
