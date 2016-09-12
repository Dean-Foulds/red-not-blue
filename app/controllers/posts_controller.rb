class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order("created_at DESC").all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    # @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :show
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :post_content, photo: [], video: [])
  end
end
