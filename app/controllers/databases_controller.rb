class DatabasesController < ApplicationController
  def show
    @comment = Comment.new
    @database = Database.find(params[:id])
    @tables = @database.tables
  end
end
