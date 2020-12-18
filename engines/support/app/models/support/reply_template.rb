# Шаблон ответа на тикет
module Support
  class ReplyTemplate < ApplicationRecord
    validates :subject, presence: true

    def to_s
      subject
    end
  end
end
