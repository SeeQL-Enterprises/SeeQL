class DatabasesController < ApplicationController
  def show
    @comment = Comment.new
    @database = Database.find(params[:id])
    @project = @database.project
    @tables = @database.tables
    authorize @project
  end

  def create
    DatabaseAccessor.new(database_params)
  end

  private

  def database_params
    params.require(:database).permit(:host, :db_name, :user, :password)
  end
end
