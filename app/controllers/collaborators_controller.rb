class CollaboratorsController < ApplicationController
    before_action :set_collaborator, only: %i[update destroy]

    def create
        @collaborator = Collaborator.new
        authorize @collaborator
        @collaborator.user = set_user

        @project = Project.find(params[:project_id])
        @collaborator.project = @project

        if @project.collaborators.any? { |collaborator| collaborator.user == @collaborator.user }
            render 'projects/show'
        elsif @collaborator.save
            redirect_to project_path(@project)
        else
            render 'projects/show'
        end
    end

    def update
        @project = Project.find(params[:project_id])

        authorize @collaborator
        @collaborator.update(user: User.find_by_email(params[:email]))

        if @collaborator.save!
            redirect_to project_path(@project), notice: 'Collaborator successfully updated!'
        else
            render :edit
        end
    end

    def destroy
        authorize @collaborator
        @collaborator.destroy
    end

    def set_collaborator
        @collaborator = Collaborator.find(params[:id])
    end

    private

    def collaborator_params
        params.require(:collaborator).permit(:user)
    end

    def set_user
        User.find_by_email(collaborator_params[:user])
    end
end
