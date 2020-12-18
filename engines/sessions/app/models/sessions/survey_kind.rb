module Sessions
  class SurveyKind < ApplicationRecord
    has_many :surveys

    validates :name, presence: true
  end
end
