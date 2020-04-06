class ColumnPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope.all
        end
    end

    def create?
        true
    end

    def destroy?
        true
    end
end
