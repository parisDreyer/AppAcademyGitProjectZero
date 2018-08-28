class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @players = [name1, name2]
    @cups = Array.new(14)
    @active_player = @players.first
    place_stones
  end

  # helper method to #initialize every non-store cup with four stones each
  def place_stones
    @cups.map!.with_index do |cup, idx|
      idx == 13 || idx == 6 ? [] : [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 14
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    @active_player = current_player_name
    begin
      valid_move?(start_pos)
      collection = @cups[start_pos].pop(@cups[start_pos].length)
      i = start_pos + 1
      until collection.empty?
        i = i % @cups.length
        @cups[i] << collection.shift unless other_player_cup?(i)
        i += 1 unless collection.empty?
      end
    rescue
      retry
    end
    next_turn(i)
    render
    whos_turn_next(i)
  end

  def whos_turn_next(i)
    if i == 6 || i == 13 && !other_player_cup?(i)
      :prompt
    elsif cups[i].length - 1 > 0
      i
    else
      :switch
    end
  end

  def other_player_cup?(cup_idx)
    if @active_player == @players.last && cup_idx == 6
      true
    elsif @active_player == @players.first && cup_idx == 13
      true
    else
      false
    end
  end

# helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  def next_turn(ending_cup_idx)

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def switch_players
    if @active_player == @players.first
      @active_player = @players.last
    else
      @active_player = @players.first
    end
  end

  def one_side_empty?
    @cups[7..12].all? { |ar| ar.empty? } || @cups[0..6].all? { |ar| ar.empty? }
  end

  def winner
    if @cups[13].length == @cups[6].length
      :draw
    elsif @cups[13].length > @cups[6].length
      @players.last
    else
      @players.first
    end
  end
end
