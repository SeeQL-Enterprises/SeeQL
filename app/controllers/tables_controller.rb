class TablesController < ApplicationController
  def index
    @comment = Comment.new
    @project = policy_scope(Project)
    @database = Database.find(params[:database_id])
    @tables = @database.tables.displayed
    @columns = @tables.columns
    @table = Table.new
    @column = Column.new
  end

  def new
    @table = Table.new
    @table.columns.build
  end

  def create
    @table = Table.new(table_params)
    authorize @table
    @database = Database.find(params[:database_id])
    @table.database = @database
    columns_params = table_params[:columns_attributes]
    @table.save!
    redirect_to database_tables_path
  end

  private
  def table_params
    params.require(:table).permit(:name, columns_attributes: Column.attribute_names.map(&:to_sym).push(:_destroy))
  end

end

#
