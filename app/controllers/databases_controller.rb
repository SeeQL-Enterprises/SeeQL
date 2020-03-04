class DatabasesController < ApplicationController
  def show
    @database = Database.find(params[:id])
    @tables = @database.tables
  end
end
