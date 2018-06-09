class PostsController < ApplicationController
  before_action :get_post, only:[:show, :edit, :update]
    def new
      @post = Post.new
    end

    def create
      post = Post.create post_params
      if post.persisted?
        if params[:file].present?
          req = Cloudinary::Uploader.upload(params[:file])
          post.image = req["public_id"]
          post.save
        end
        redirect_to posts_path
      else
        flash[:errors] = post.errors.full_messages
        redirect_to new_post_path
      end
    end

    def index
      @posts = Post.all
    end

    def show
    end

    def edit
    end

    def update
      # if params[:file].present?
      #   req = Cloudinary::Uploader.upload(params[:file])
      #   @post.image = req["public_id"]
      # end
      @post.update post_params
      redirect_to post_path

    end

    def destroy
      p = Post.find params[:id]
      p.destroy
      # raise 'hell'
      redirect_to posts_path
    end

    private
    def get_post
      @post = Post.find params[:id]
    end

    private
    def post_params
      params.require(:post).permit(:title, :image, :content)
    end
end
