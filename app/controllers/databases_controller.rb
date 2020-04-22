class DatabasesController < ApplicationController
    def show
        @comment = Comment.new
        @database = Database.find(params[:id])
        @project = @database.project
        @tables = @database.tables
        authorize @project
    end

    def create
        @db_accessor = PostgresAccessor.new(database_params)
        authorize @db_accessor
        @db_accessor.call

        @project = Project.find(params[:project_id])

        redirect_to project_path(@project)
    end

    private

    def database_params
        params.require(:new_database).permit(:name, :host, :db_name, :user, :password, :project_id)
    end
end
