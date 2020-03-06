class TablesController < ApplicationController
  def index
    @comment = Comment.new
    @project = policy_scope(Project)
    @database = Database.find(params[:database_id])
    @tables = @database.tables.displayed
    @columns = @tables.columns
  end
end
