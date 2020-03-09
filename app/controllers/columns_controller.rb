class ColumnsController < ApplicationController

  def create
    @column = Column.new(column_params)
    authorize @column
  end

  private

  def column_params
    params.require(:column).permit(:name, :datatype)
  end
end
