class SimpleTree
  attr_reader :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if !@left
      @left = SimpleTree.new(value)
    elsif !@right
      @right = SimpleTree.new(value)
    else
      if rand(2) == 0
        @left.insert(value)
      else
        @right.insert(value)
      end
    end
  end

  def dfs(el)
    if @value == el
      return true
    else
      left_dfs = false
      if !!@left
        left_dfs = @left.dfs(el)
      end

      right_dfs = false
      if !!@right
        right_dfs = @right.dfs(el)
      end
      return left_dfs || right_dfs
    end
  end
end

s = SimpleTree.new(10)
s.insert(19)
s.insert(32)
s.insert(41)
s.insert(4)
s.insert(12)
s.insert(29)

puts "s has 20: #{s.dfs(20)}"
puts "s has 32: #{s.dfs(32)}"
puts "s has 19: #{s.dfs(19)}"
puts "s has 3: #{s.dfs(3)}"
puts "s has 4: #{s.dfs(4)}"
puts "s has 29: #{s.dfs(29)}"
puts "s has 31: #{s.dfs(31)}"
