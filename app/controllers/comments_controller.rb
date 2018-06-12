class CommentsController < ApplicationController
  def index
    @comments = Comment.where post_id: params[:id]
    render :json => @comments.as_json( :include => [ :user ])
  end
  def create
    @comment = Comment.new(params[:comment])
    @comment.save
    format.json { render json: @comment, status: :created }
  end
end
