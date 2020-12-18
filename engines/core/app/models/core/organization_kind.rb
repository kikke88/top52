module Core
  class OrganizationKind < ApplicationRecord
    has_many :organizations, foreign_key: :kind_id

    def to_s
      name
    end
  end
end
