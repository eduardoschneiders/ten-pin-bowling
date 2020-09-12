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

  private

  def extra_points(frame:, previous_frame:, second_previous_frame:)
    return if frame.last_frame?

    if frame.strike?
      strike_extra_points(previous_frame: previous_frame, second_previous_frame: second_previous_frame)
    elsif frame.spare?
      (previous_frame.first_score || 0)
    end
  end

  def strike_extra_points(previous_frame:, second_previous_frame:)
    if previous_frame.strike? && !previous_frame.last_frame?
      (previous_frame.first_score || 0) + (second_previous_frame.first_score || 0)
    else
      (previous_frame.first_score || 0) + (previous_frame.second_score || 0)
    end
  end
end
