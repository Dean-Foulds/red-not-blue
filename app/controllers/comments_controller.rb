class CommentsController < ApplicationController
  # before_action :set_comment
  before_action :set_post
  def index
    # @comments = Comment.all
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
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
    authorize @post
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
