require File.expand_path('../frame', __dir__)

describe Frame do
  describe '#initialize' do
    context 'when the score are inside range' do
      subject { Frame.new(first_score: 1, second_score: 2) }

      it 'should calculate the partial score' do
        expect(subject.partial_score).to eql(3)
      end
    end

    context 'when the third score is needed' do
      subject { Frame.new(first_score: 1,second_score: 2, third_score: 3) }

      it 'should raise error' do
        expect(subject.partial_score).to eql(6)
      end
    end

    context 'when the first score is foul' do
      subject { Frame.new(first_score: false, second_score: 2) }

      it 'should raise error' do
        expect(subject.partial_score).to eql(2)
      end
    end

    context 'when the second score is foul' do
      subject { Frame.new(first_score: 4, second_score: false) }

      it 'should raise error' do
        expect(subject.partial_score).to eql(4)
      end
    end

    context 'when sum of score is above 10' do
      subject { Frame.new(first_score: 9,second_score:9).validate! }

      it 'should raise error' do
        expect { subject }.to raise_error('score out of range: 18')
      end
    end

    context 'with a negative score' do
      subject { Frame.new(first_score: -1, second_score: 0).validate! }

      it 'should raise error' do
        expect { subject }.to raise_error('score out of range: -1')
      end
    end

    context 'with a positive and a negative score' do
      subject { Frame.new(first_score: -1, second_score: 1).validate! }

      it 'should raise error' do
        expect { subject }.to raise_error('score out of range: 0')
      end
    end
  end

  describe '#strike?' do
    context 'when first score is not 10' do
      subject { Frame.new(first_score: 0,second_score: 1).strike? }

      it 'should not be a strike' do
        expect(subject).to eql(false)
      end
    end

    context 'when first score is 10' do
      subject { Frame.new(first_score: 10).strike? }

      it 'should be a strike' do
        expect(subject).to eql(true)
      end
    end
  end

  describe '#spare?' do
    context 'when the sum of score is below 10' do
      subject { Frame.new(first_score: 6,second_score: 2).spare? }

      it 'should not be a spare' do
        expect(subject).to eql(false)
      end
    end

    context 'when the sum of score is equal 10' do
      subject { Frame.new(first_score: 6,second_score: 4).spare? }

      it 'should not be a spare' do
        expect(subject).to eql(true)
      end
    end
  end
end
