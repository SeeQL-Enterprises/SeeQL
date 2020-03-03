class ProjectsController < ApplicationController

  def new
    @project = Project.new
    raise
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @collaborator = Collaborator.new
    @other_users = User.where.not(id: current_user.id)
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
