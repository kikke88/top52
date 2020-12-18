class AlgoImplementation < ApplicationRecord
  self.primary_key = "id"
  belongs_to :alg, foreign_key: "alg_id", class_name: "AlgowikiEntity"
end
