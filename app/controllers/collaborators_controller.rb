class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new
    authorize @collaborator
    @collaborator.user = set_user
    @project = Project.find(params[:project_id])
    @collaborator.project = @project
    if @collaborator.save
      redirect_to project_path(@project)
    else
      render 'projects/show'
    end

  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:user)
  end

  def set_user
    User.find(collaborator_params[:user])
  end

end
