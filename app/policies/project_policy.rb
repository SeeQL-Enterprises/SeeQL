class ProjectPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            Project.joins(:collaborators).where(collaborators: { user: user }) + user.projects
        end
    end

    def index?
        true
        # return record.user == user || record.collaborators.where(user: user).any? #|| user.admin
    end

    def new?
        user
    end

    def create?
        new?
    end

    def show?
        index?
    end

    def edit?
        # record = the project we're authorizing
        # user = user who is currently logged in
        index? # check that the user is the one who created the project
    end

    def update?
        index?
    end

    def destroy?
        index?
    end
end
