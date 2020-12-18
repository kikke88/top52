module Core
  class SuretyScan < ApplicationRecord
    belongs_to :surety

    mount_uploader :image, SuretyScanUploader
    validates :image, presence: true
  end
end
