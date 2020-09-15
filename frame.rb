class Frame
  attr_accessor :first_score, :second_score, :third_score, :last_frame

  def initialize(first_score:, second_score: 0, third_score: 0, last_frame: false)
    @first_score = first_score
    @second_score = second_score
    @third_score = third_score
    @last_frame = last_frame
  end

  def validate!
    raise "score out of range: #{partial_score}" if out_of_range?
  end

  def strike?
    first_score == 10
  end

  def spare?
    partial_score == 10
  end

  def last_frame?
    last_frame
  end

  def partial_score
    scores.sum
  end

  private

  def scores
    [
      (first_score || 0),
      (second_score || 0),
      (third_score || 0)
    ]
  end

  def out_of_range?
    any_score_negative? || above_score?
  end

  def any_score_negative?
    scores.any?(&:negative?)
  end

  def above_score?
    partial_score > (last_frame? ? 30 : 10)
  end
end
