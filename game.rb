class Game
  attr_accessor :frames

  def initialize(frames)
    @frames = frames
  end

  def calculate_score
    frames.reverse!

    frames.each_with_index.inject(0) do |total, (frame, i)|
      total += extra_points(
        frame: frame,
        previous_frame: frames[i - 1],
        second_previous_frame: frames[i - 2]
      ).to_i

      total + frame.partial_score
    end
  end

  def extra_points(frame:, previous_frame:, second_previous_frame:)
    return if frame.last_frame?

    if frame.strike?
      if previous_frame.strike?
        previous_frame.first_score + second_previous_frame.first_score
      else
        previous_frame.first_score + previous_frame.second_score
      end
    elsif frame.spare?
      previous_frame.first_score
    end
  end
end
