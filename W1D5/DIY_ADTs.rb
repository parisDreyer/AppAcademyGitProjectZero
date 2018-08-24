class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack << el
  end

  def pop
    @stack.pop
  end

  def peek
    nxt = @stack.last
    nxt
  end
end

# stack tests
# node_stack = Stack.new
# node_stack.push(1)
# p node_stack.peek
# node_stack.push([1])
# p node_stack.pop

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el)
  end

  def dequeue
    @queue.shift
  end

  def peek
    nxt = @queue.first
    nxt
  end

end

# queue tests
# queue = Queue.new
# queue.enqueue(1)
# p queue.peek
# queue.enqueue([1,2,3])
# p queue.dequeue

class Map

  def initialize
    @map = []
  end

  def set(key, value)
    maybe_idx = index_of_key?(key)
    if maybe_idx
      @map[maybe_idx][1] = value
    else
      @map << [key, value]
    end
    true
  end

  def get(key)
    maybe_idx = index_of_key?(key)
    if maybe_idx
      key_val = @map[maybe_idx]
      key_val
    else
      nil
    end
  end

  def delete(key)
    maybe_idx = index_of_key?(key)
    if maybe_idx
      removed = @map.delete_at(maybe_idx)
      removed
    else
      nil
    end
  end

  def show
    map2show = []
    @map.each { |group| map2show << group.dup }
    map2show
  end

  private

  def index_of_key?(key)
    @map.each_with_index { |group, i| return i if group.first == key }
    nil
  end

end

# map tests
map = Map.new
(0..100).each { |k| map.set(k, rand) }
p "Hundredth el: #{map.get(100)}"
delete_index = 0
shown = map.show
until shown.empty?
  p 'show'
  p shown
  shown = map.show
  p 'get'
  p map.get(delete_index)
  p 'delete'
  p map.delete(delete_index)
  delete_index += 1
end
