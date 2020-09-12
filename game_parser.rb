require 'stringio'

class GameParser
  attr_accessor :input, :players_scores

  def initialize
    @input = $stdin.read
    @players_scores = {}
  end

  def parse
    input.split("\n").each do |turn|
      player_name, score = turn.split(' ')

      players_scores[player_name] ||= []
      score = score == 'F' ? score : score.to_i
      players_scores[player_name] << score
    end
  end
end
