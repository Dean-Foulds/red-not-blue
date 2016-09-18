class CommentsController < ApplicationController
  before_action :set_post
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @comments = policy_scope(Comment)
  end

  def show

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    authorize @comment
    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    authorize @comment
    authorize @post
    if @comment.update_attributes(comment_params)
      redirect_to @post
    else
      render :action => "edit"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    authorize @comment
    redirect_to post_path(@post)
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorised to complete this action"
    redirect_to(request.referrer || root_path)
  end

  def set_post
    @post = Post.find(params[:post_id])
    authorize @post
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
