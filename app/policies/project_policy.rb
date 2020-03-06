class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      Project.joins(:collaborators).where(collaborators: {user: user}) + user.projects
    end
  end

  def index?
    return true
    # return record.user == user || record.collaborators.where(user: user).any? #|| user.admin
  end

  def new?
    return user
  end

  def create?
    return new?
  end

  def show?
    return index?
  end

  def edit?
    # record = the project we're authorizing
    # user = user who is currently logged in
    return index? # check that the user is the one who created the project
  end

  def update?
    return index?
  end

  def destroy?
    return index?
  end
end
