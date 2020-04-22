class ProjectsController < ApplicationController
    def index
        @projects = policy_scope(Project)
    end

    def show
        @collaborator = Collaborator.new
        @project = Project.find(params[:id])
        @database = @project.databases
        authorize @project
    end

    def new
        @project = Project.new
        authorize @project
    end

    def create
        @project = Project.new(project_params)
        authorize @project
        @project.user = current_user

        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    private

    def project_params
        params.require(:project).permit(:name, :image)
    end

    def project_members
        @project.collaborators.map { |collaborator| collaborator.user.id }.push(current_user.id)
    end
end
