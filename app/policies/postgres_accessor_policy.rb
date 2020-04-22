class PostgresAccessorPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            scope.all
        end
    end

    def create?
        true
    end
end
