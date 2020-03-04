class TablesController < ApplicationController
  def index
    @database = Database.find(params[:database_id])
    @tables = Table.all
  end
end
