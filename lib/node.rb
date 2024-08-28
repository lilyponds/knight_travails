class Node
  def initialize(coordinate = nil, steps = 0, predecessors = nil)
    @coordinate = coordinate
    @steps = steps
    @predecessors = predecessors
  end

  attr_accessor :coordinate, :steps, :predecessors
end
