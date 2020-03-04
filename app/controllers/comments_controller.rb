class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.table = params[:table_id]
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
