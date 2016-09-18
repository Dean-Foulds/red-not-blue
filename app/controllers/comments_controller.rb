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
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @post
    else
      flash.now[:danger] = "error"
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
    params.require(:comment).permit(:content)
  end
end
