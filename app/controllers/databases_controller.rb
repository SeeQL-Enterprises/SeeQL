class DatabasesController < ApplicationController
  def show
    @comment = Comment.new
    @database = Database.find(params[:id])
    @project = @database.project
    @tables = @database.tables
    authorize @project
  end
end
