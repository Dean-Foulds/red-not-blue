class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @post = Post.all
  end
  def show
    @post = Post.new
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:post_content, :title, :pictures)
  end
end
