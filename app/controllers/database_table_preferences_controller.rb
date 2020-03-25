class DatabaseTablePreferencesController < ApplicationController
    def update
        table_ids = database_params[:tables].reject {|id| id.blank? }.map {|id| id.to_i }
        database = Database.find(params[:id])
        authorize database.project

        database.tables.each do |table|
            if table_ids.include? table.id
                table.update(display: true)
            else
                table.update(display: false)
            end
        end
        redirect_to database_tables_path(database)
    end

    private
    
    def database_params
        params.require(:database).permit(tables: [])
    end
end
