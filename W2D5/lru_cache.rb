class LRUCache
  def initialize(size)
    @size = size
    @current_size = 0
    @cache = Array.new(size)
  end

  def count
    @current_size + 1
  end

  def add(el)
    maybe_include_idx = include?(el)
    p @cache
    if maybe_include_idx
      delete_and_stack(maybe_include_idx, el)
    elsif @current_size >= @size
      @current_size
      shift_to_left(0, el)
    else
      @cache[@current_size] = el
      @current_size += 1
    end

    nil
  end

  def show
    @cache
  end

  private
  # helper methods go here!
    def shift_to_left(start_idx = 0, last_val = nil)
      (start_idx...@size - 1).each do |idx|
        new_val = @cache[idx + 1]
        @cache[idx] = new_val
      end
      @cache[-1] = last_val
    end

    def include?(el)
      (0...@size).each do |i|
        return i if @cache[i] == el
      end
      false
    end

    def delete_and_stack(el_idx, el)
      @cache[el_idx] = nil
      shift_to_left(el_idx, el)
    end
end




p 'testing'
p johnny_cache = LRUCache.new(4)
p
p johnny_cache.add("I walk the line")
p johnny_cache.add(5)
p
p johnny_cache.count # => returns 2
p
p johnny_cache.add([1,2,3])
p johnny_cache.add(5)
p johnny_cache.add(-5)
p johnny_cache.add({a: 1, b: 2, c: 3})
p johnny_cache.add([1,2,3,4])
p johnny_cache.add("I walk the line")
p johnny_cache.add(:ring_of_fire)
p johnny_cache.add("I walk the line")
p johnny_cache.add({a: 1, b: 2, c: 3})
p "_____THE___TEST!____"
p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
