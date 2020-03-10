class ColumnsController < ApplicationController

  def create
    @column = Column.new(column_params)
    authorize @column
    @database = @column.table.database
    @column.save!
    redirect_to database_tables_path(@database)
  end

  private

  def column_params
    params.require(:column_proxy).permit(:name, :datatype, :table_id)
  end
end
