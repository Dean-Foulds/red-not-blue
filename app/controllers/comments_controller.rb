class CommentsController < ApplicationController
  before_action :set_post
  def index
    @comments = Comment.all
  end

  def show

  end

  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      render "posts/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  @post = Post.find(params[:post_id])
  end

  def update
    @comment = Comment.find(params[:id])
         @post = @comment.post
          if @comment.update_attributes(comment_params)
            redirect_to @post
          else
           render :action => "edit"
        end
    # if @comment.update(comment_params)
    #   redirect_to @post
    # else
    #   render "posts/show"
    # end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
