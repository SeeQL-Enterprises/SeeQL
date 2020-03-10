class ColumnsController < ApplicationController

  def create
    @column = Column.new(column_params)
    authorize @column
    @database = @column.table.database
    @column.save!
    respond_to do |format|
      format.js { @counter = column_params[:counter] }
      format.html { redirect_to database_tables_path(@database) }
    end

  end

  def destroy
    @column = Column.find(params[:id])
    @database = @column.table.database
    authorize @column
    if @column.edit
      @column.destroy
      redirect_to database_tables_path(@database)
    else
      redirect_to database_tables_path(@database), flash: { error: "You can only delete columns that are not in your DB" }
    end
  end

  private

  def column_params
    params.require(:column_proxy).permit(:name, :datatype, :table_id, :edit, :counter)
  end
end
