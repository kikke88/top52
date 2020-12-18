module Core
  class DirectionOfScience < ApplicationRecord
    has_and_belongs_to_many :projects, join_table: "core_direction_of_sciences_per_projects"

    def to_s
      name
    end
  end
end
