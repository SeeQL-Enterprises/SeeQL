class DatabasesController < ApplicationController
    def show
        @comment = Comment.new
        @database = Database.find(params[:id])
        @project = @database.project
        @tables = @database.tables
        authorize @project
    end

    def create
        @db_accessor =
            if params[:new_database][:db_type] == 'PostgreSQL'
                PostgresAccessor.new(database_params)
            else
                MysqlAccessor.new(database_params)
            end

        authorize @db_accessor
        @db_accessor.call

        @project = Project.find(params[:project_id])

        redirect_to project_path(@project)
    end

    private

    def database_params
        params.require(:new_database).permit(:db_type, :name, :host, :port, :db_name, :user, :password, :project_id)
    end
end
