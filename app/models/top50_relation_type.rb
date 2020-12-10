class Top50RelationType < ApplicationRecord
  has_many :top50_relations, foreign_key: "type_id"
end
