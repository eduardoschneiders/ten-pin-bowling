class Frame
  attr_accessor :first_score, :second_score

  def initialize(first_score, second_score)
    @first_score = first_score
    @second_score = second_score

    raise "score out of range: #{partial_score}" if out_of_range?
  end

  def strike?
    first_score == 10
  end

  def spare?
    partial_score == 10
  end

  def partial_score
    return first_score if strike?

    first_score + second_score
  end

  private

  def out_of_range?
    partial_score.negative? || partial_score > 10
  end
end
