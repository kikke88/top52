class Top50MeasureScale < ApplicationRecord
  belongs_to :top50_measure_unit, foreign_key: "measure_unit_id"
end
