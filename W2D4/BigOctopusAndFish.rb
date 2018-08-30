fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def compare_fishes_n2(fish)
  best = nil
  fish.each do |ff|
    is_great = true
    fish.each do |of|
      if ff.length < of.length
        is_great = false
        break
      end
    end
    best = ff if is_great
  end
  best
end



def dominant_octopus(fish)
  quicksort_half(fish)
end



def quicksort_half(arr)
  return arr if arr.length < 2
  pivot = arr.first
  right = arr.drop(1).select { |el| el.length >= pivot.length }
  ([pivot] + quicksort_half(right))
end


def clever_octopus(fish)
  max_fish = fish.first
  fish.each { |f| max_fish = f if f.length > max_fish.length }
  max_fish
end



tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles)
  idx = nil
  tiles.each_with_index do |tile, i|
    if tile == dir
      idx = i
      break
    end
  end
  idx
end

better_tiles = {
  up: 0, right: 1, right_down: 2,
  down: 3, left_down: 4, left: 5,
  left_up: 7
}

def constant_dance(tile, better_tiles)
  better_tiles[tile]
end




p "compare fishes in n^2 time"
p compare_fishes_n2(fishes)


p "compare fishes in O(n log n) time"
p dominant_octopus(fishes).last

p "compare fishes in O_n time"
p clever_octopus(fishes)



p "slow dance after eating fish"
['up', 'left-down', 'up'].each { |m| print "#{slow_dance(m, tiles_array)} " }

p 'constant dance after warming up'
[:up, :left_down, :left_up].each { |m| print "#{constant_dance(m, better_tiles)} " }
