class Frame
  attr_accessor :first_score, :second_score, :third_score, :last_frame

  def initialize(first_score, second_score = nil, third_score = nil)
    @last_frame = !third_score.nil?
    @first_score = first_score.to_i
    @second_score = second_score.to_i
    @third_score = third_score.to_i
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
    first_score + second_score + third_score
  end

  private

  def out_of_range?
    partial_score.negative? || (partial_score > (last_frame? ? 30 : 10))
  end
end
