require_relative './grid_maker'
require_relative './node'

def knight_moves(source, destination)
  KnightMoves.new(destination, source)
end

class KnightMoves
  private

  def initialize(source, destination)
    @source = source
    @destination = destination
    @source_node = Node.new(source, 0)
    @queue = [@source_node]
    @visited = [@source]
    @destination_node = nil
    queue_empty?
  end

  def queue_empty?
    return if @queue.empty?

    traverse
  end

  def traverse
    edges = where_can_the_knight_go_from(@queue[0].coordinate)
    if edges.include?(@destination)
      @destination_node = Node.new(@destination, @queue[0].steps + 1, @queue[0])
      all_steps_taken(@destination_node)
      return
    end
    temp = edges.reject { |coordinates| @visited.include?(coordinates) }

    temp.each do |coordinates|
      @visited.push(coordinates)
      @queue.push(Node.new(coordinates, @queue[0].steps + 1, @queue[0]))
    end
    @queue.shift
    queue_empty?
  end

  def all_steps_taken(node)
    # prints out the total steps taken and list of the coordinates
    puts "You made it in #{node.steps} moves! Here's your path:" if node == @destination_node
    p node.coordinate
    return if node.predecessors.nil?

    all_steps_taken(node.predecessors)
  end
end
