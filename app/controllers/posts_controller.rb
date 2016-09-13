class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order("created_at DESC").all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :show
    end
  end

  def edit
  end

  def update

  end


  def destroy
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :post_content, :summary, photo: [], video: [])
  end
end
