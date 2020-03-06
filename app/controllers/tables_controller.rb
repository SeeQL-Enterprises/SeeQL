class TablesController < ApplicationController
  def index
    @comment = Comment.new
    @database = Database.find(params[:database_id])
    @tables = @database.tables.displayed
    @columns = @tables.columns
  end

  def create

  end
end
