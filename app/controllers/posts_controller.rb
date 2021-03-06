class PostsController < ApplicationController
  before_action :check_if_logged_in, except: [:like, :index, :show]
  before_action :get_post, only:[:show, :edit, :update]
    def new
      @post = Post.new
    end

    def create
      post = Post.create post_params
      post.user = @current_user
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
      if(!@current_user)
        @current_user = User.second
      end
    end

    def edit
    end

    def update
      if params[:file].present?
        req = Cloudinary::Uploader.upload(params[:file])
        @post.image = req["public_id"]
      end
      @post.update post_params
      redirect_to post_path

    end

    def destroy
      p = Post.find params[:id]
      p.destroy
      # raise 'hell'
      redirect_to posts_path
    end

    def like
      p = Post.find(params[:id])
      if @current_user.liked_posts.include?( p )
        # already in liked posts list, so remove
         @current_user.liked_posts.destroy( p )
         render json: { removed: true, likes: p.liked_by.count }

      else
        # not in liked posts yet, so add
        @current_user.liked_posts << p
        render json: { added: true , likes: p.liked_by.count }
      end
    end

    private
    def get_post
      @post = Post.find params[:id]
    end

    private
    def post_params
      params.require(:post).permit(:title, :image, :content, :city_id, :address)
    end
end
