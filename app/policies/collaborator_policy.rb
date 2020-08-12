class CollaboratorPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope.all
        end
    end

    def create?
        true
    end

    def update?
        create?
    end
end
