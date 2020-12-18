module Wiki
  class Page < ApplicationRecord
    validates :content, :name, :url, presence: true
    validates :url, uniqueness: true

    def to_param
      "#{id}-#{url}"
    end
  end
end
