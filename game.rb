class Game
  attr_accessor :frames

  def initialize(frames)
    @frames = frames
  end

  def calculate_score
    total = 0

    frames.reverse.each_with_index do |frame, i|
      if frame.strike?
        total += frames.reverse[i-1].first_score + frames.reverse[i-1].second_score
      elsif frame.spare?
        total += frames.reverse[i-1].first_score
      end

      total += frame.partial_score
    end

    total
  end
end
