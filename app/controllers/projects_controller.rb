class ProjectsController < ApplicationController

  def new
    @project = Project.new
    raise
  end

  def create
    @project = Project.new(project_params)
    @project.user
    if @project.save
      redirect_to project_path
    else
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
