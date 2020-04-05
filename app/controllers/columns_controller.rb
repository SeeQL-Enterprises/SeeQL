class ColumnsController < ApplicationController
    def create
        @column = Column.new(column_params)
        authorize @column
        @database = @column.table.database

        @column.save!

        respond_to do |format|
            format.js do
                @counter = params[:column_proxy][:counter]
                @table = @column.table
            end

            format.html { redirect_to database_tables_path(@database) }
        end
    end

    def destroy
        @column = Column.find(params[:id])
        @database = @column.table.database
        authorize @column

        @column.destroy if @column.edit

        respond_to do |format|
            format.js
            format.html { redirect_to database_tables_path(@database) }
        end
    end

    private

    def column_params
        params.require(:column_proxy).permit(:name, :datatype, :table_id, :edit)
    end
end
