class TablesController < ApplicationController
  def index
    @comment = Comment.new
    @database = Database.find(params[:database_id])
    @tables = @database.tables.displayed
    @columns = @tables.columns
    @table = Table.new
    @column = Column.new
  end

  def create
    @table = Table.new
    @column = Column.new
  end

end
