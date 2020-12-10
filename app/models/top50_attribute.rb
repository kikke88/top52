class Top50Attribute < ApplicationRecord
  has_one :top50_attribute_dbval, dependent: :destroy, foreign_key: "id"
  has_one :top50_attribute_dict, dependent: :destroy, foreign_key: "id"
end
