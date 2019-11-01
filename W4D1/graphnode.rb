class GraphNode
    attr_accessor :neighbors, :value
    def initialize(value)
        @value = value
        @neighbors = []
    end
end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = []
    until queue.empty?
        current_node = queue.shift
        return current_node if current_node.value == target_value
        visited << current_node
        current_node.neighbors.each {|neighbor| queue << neighbor if !visited.include?(neighbor)}
    end
    nil
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p bfs(a,"b")
p bfs(a, "f")