require "byebug"
require_relative "player"

class Board

  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    self.place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, i|
      if i == 6 || i == 13
        next
      else
        4.times {cup << :stone}
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos > 13
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    counter = @cups[start_pos].count(:stone)
    @cups[start_pos] = []
    step = 1
    until counter == 0
      pos = (start_pos+step) % 14
      if pos == 13 && current_player_name == @player2.name
        @cups[pos] << :stone 
        counter -= 1
      elsif pos == 6 && current_player_name == @player1.name
        @cups[pos] << :stone 
        counter -= 1
      elsif pos == 6 || pos == 13
        step += 1
        next
      else
        @cups[pos] << :stone
        counter -= 1
      end
      step += 1
    end
    self.render
    self.next_turn(pos)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count(:stone) == 1
      :switch
    else
      ending_cup_idx
    end # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    [@cups[0..5],@cups[7..12]].any? {|arr| arr.all? {|ele| ele.empty?}}
  end

  def winner
    p1_count, p2_count = @cups[6].count(:stone), @cups[13].count(:stone)
    case p1_count <=> p2_count
    when -1
      @player2.name
    when 0
      :draw
    when 1
      @player1.name
    end
  end
end

board = Board.new("evans", "seb")
board.render
