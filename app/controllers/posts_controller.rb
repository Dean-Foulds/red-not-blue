class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  skip_before_action :authenticate_user!, only: [ :index, :show ]


  def index
    @posts = policy_scope(Post).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment.post = @post
    authorize Comment
    authorize Post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
      @post = Post.new(post_params)
      authorize @post
    if @post.save
      redirect_to @post
    else
      render :edit
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render "posts/show"
    end
    authorize @post
  end


  def destroy
  end


  private


  def user_not_authorized
    flash[:alert] = "You are not authorised to complete this action"
    redirect_to(request.referrer || root_path)
  end

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :post_content, :summary, photos: [], video: [])
  end
end
