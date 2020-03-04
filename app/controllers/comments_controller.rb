class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if params[:table_id]
      @table = Table.find(params[:table_id])
      @comment.commentable = @table
      @comment.save
      redirect_to database_path(@table.database)
    else
      @column = Column.find(params[:column_id])
      @comment.commentable = @column
      @comment.save
      redirect_to database_path(@column.table.database)
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
