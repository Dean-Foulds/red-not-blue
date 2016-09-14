class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

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
      redirect_to @post
    else
      render :new
    end
  end

  def edit
    #@comment = @post.comments.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render "posts/show"
    end
      @comment = @post.comments.find(params[:id])
    if @comment.update(comments_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
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
