class AlgowikiRelationType < ApplicationRecord
    has_many :algowiki_relations, foreign_key: "type_id"
end
