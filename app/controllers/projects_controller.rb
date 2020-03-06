class ProjectsController < ApplicationController

  def index
    # @projects = current_user.projects # only shows where user admin
    # @projects = policy_scope(Project).all
    # This is a test
    @projects = policy_scope(Project)
  end

  def show
    @project = Project.find(params[:id])
    @collaborator = Collaborator.new
    @other_users = User.where.not(id: get_project_members)
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
    params.require(:project).permit(:name)
  end

  def get_project_members
    @project.collaborators.map {|c| c.user.id }.push(current_user.id)
  end
end
