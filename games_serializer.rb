class GamesSerializer
  attr_accessor :games

  def initialize(games:)
    @games = games
  end

  def output
    print_frames

    games.each do |game|
      GamePlayerSerializer.new(
        game: game[:game],
        player_name: game[:player_name]
      ).output
    end
  end

  private

  def print_frames
    frames_count = 10.times.map { |i| i + 1 }.join("\t\t")
    puts "Frame\t\t#{frames_count}"
  end
end
