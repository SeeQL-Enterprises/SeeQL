class TablesController < ApplicationController
  def index
    @database = Database.find(params[:database_id])
    @tables = @database.tables.displayed
    @columns = @tables.columns
  end
end
