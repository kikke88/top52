module Core
  class ProjectKind < ApplicationRecord
    validates :name, presence: true
  end
end
