class GameBuilder
  attr_accessor :scores

  def initialize(scores)
    @scores = scores
  end

  def build
    frames = build_frames

    Game.new(frames)
  end

  private

  def build_frames
    10.times.map do |i|
      last_frame = i == 9
      first_score, second_score, third_score = fetch_scores(last_frame: last_frame)

      Frame.new(
        first_score: first_score,
        second_score: second_score,
        third_score: third_score,
        last_frame: last_frame
      )
    end
  end

  def fetch_scores(last_frame:)
    first_score = scores.shift
    second_score = scores.shift if last_frame || first_score != 10
    third_score = scores.shift if last_frame

    [first_score, second_score, third_score].map { |score| convert_score(score) }
  end

  def convert_score(score)
    score == 'F' ? false : score
  end
end
