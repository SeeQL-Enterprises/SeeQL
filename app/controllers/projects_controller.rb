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

        if @project.save!
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def edit
        @project = Project.find(params[:id])
        authorize @project
    end

    def update
        @project = Project.find(params[:id])
        authorize @project
        @project.update(project_params)

        if @project.save!
            redirect_to project_path(@project), notice: 'Project successfully updated!'
        else
            render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id])
        authorize @project
        @project.destroy
        redirect_to projects_path, notice: 'Project has been deleted!'
    end


    private

    def project_params
        params.require(:project).permit(:name, :project_image)
    end

    def project_members
        @project.collaborators.map { |collaborator| collaborator.user.id }.push(current_user.id)
    end
end
