class Game
  attr_accessor :frames, :frame_scores

  def initialize(frames)
    @frames = frames
    @frame_scores = []
  end

  def validate!
    frames.each(&:validate!)
  end

  def calculate_score # rubocop:disable  Metrics/AbcSize
    frames.each_with_index.inject(0) do |total, (frame, i)|
      total += extra_points(
        frame: frame,
        next_frame: frames[i + 1],
        second_next_frame: frames[i + 2]
      ).to_i

      frame_scores << total + frame.partial_score
      frame_scores.last
    end
  end

  private

  def extra_points(frame:, next_frame:, second_next_frame:)
    return if frame.last_frame?

    if frame.strike?
      strike_extra_points(next_frame: next_frame, second_next_frame: second_next_frame)
    elsif frame.spare? && next_frame
      (next_frame.first_score || 0)
    end
  end

  def strike_extra_points(next_frame:, second_next_frame:)
    return unless next_frame

    next_strike = next_frame.strike? && !next_frame.last_frame?
    second_score = next_strike ? (second_next_frame.first_score || 0) : (next_frame.second_score || 0)

    (next_frame.first_score || 0) + second_score
  end
end
