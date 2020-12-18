module Core
  class AccessField < ApplicationRecord
    belongs_to :access
    belongs_to :quota_kind

    def to_s
      "#{quota_kind.name}: #{quota} #{quota_kind.measurement}"
    end
  end
end
