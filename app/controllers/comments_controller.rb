class CommentsController < ApplicationController

  before_action do
    @post = Post.find(params[:post_id])
   end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
    :content,
    :post_id,
    )
  end


end
