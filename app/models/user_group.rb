# Связь пользователя и группы
class UserGroup < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
