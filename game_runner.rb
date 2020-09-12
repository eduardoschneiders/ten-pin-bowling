require File.expand_path('./game_parser', __dir__)
require File.expand_path('./games_serializer', __dir__)
require File.expand_path('./game_player_serializer', __dir__)
require File.expand_path('./game_builder', __dir__)
require File.expand_path('./game', __dir__)
require File.expand_path('./frame', __dir__)

class GameRunner
  attr_accessor :parser

  def initialize
    @parser = GameParser.new
    @parser.parse
  end

  def run
    games = parser.players_scores.map { |name, scores| { game: GameBuilder.new(scores).build, player_name: name } }
    GamesSerializer.new(games: games).output
  end
end

GameRunner.new.run
