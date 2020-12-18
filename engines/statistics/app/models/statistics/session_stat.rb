module Statistics
  class SessionStat < ApplicationRecord
    KINDS = [ ]

    include StatCollector
    include GraphBuilder
  end
end
