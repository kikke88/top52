module Sessions
  class ReportSubmitDenialReason < ApplicationRecord
    validates :name, presence: true
  end
end
