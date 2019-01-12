require "byebug"
class PolyTreeNode

 
  def initialize(value)
    @value = value 
    @parent = nil 
    @children = [] 
  end 
  
  def parent 
    @parent 
  end 

  def children 
    @children
  end 

  def value 
    @value 
  end 

  def parent=(node)
    old_parent = parent
    old_parent.children.delete(self) if !old_parent.nil?
    @parent = node  
    node.children << self if !node.nil?
  end

  def add_child(child_node)
    child_node.parent= self 
  end 

  def remove_child(child_node)
    raise "error" unless children.include?(child_node)
    child_node.parent= nil 
  end 
  
  def dfs(target_value)
    return self if self.value == target_value 
      self.children.each do |child|
        result = child.dfs(target_value)
        return result unless result.nil?
      end 
    nil 
  end 

  def bfs(target_value)
    q = []
    q.push(self)
    until q.empty?
      return q.first if q.first.value == target_value
      q.concat(q.first.children)
      q.shift
    end
    nil
  end
end