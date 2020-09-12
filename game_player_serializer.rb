class GamePlayerSerializer
  attr_accessor :game, :player_name

  def initialize(game:, player_name:)
    @game = game
    @player_name = player_name
  end

  def output
    puts player_name
    print_pinfalls
    print_scores
  end

  private

  def print_pinfalls # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    pinfalls = game.frames.map do |f|
      if f.last_frame?
        third = f.third_score ? "\t#{convert_value(f.third_score)}" : nil
        first = f.strike? ? 'X' : f.first_score

        "#{convert_value(first)}\t#{convert_value(f.second_score)}#{third}"
      elsif f.strike?
        "\tX"
      elsif f.spare?
        "#{f.first_score}\t\/"
      else
        "#{convert_value(f.first_score)}\t#{convert_value(f.second_score)}"
      end
    end

    puts "Pinfalls\t#{pinfalls.join("\t")}"
  end

  def convert_value(value)
    case value
    when 10
      'X'
    when false
      'F'
    else
      value
    end
  end

  def print_scores
    game.calculate_score
    puts "Score\t\t#{game.frame_scores.join("\t\t")}"
  end
end
