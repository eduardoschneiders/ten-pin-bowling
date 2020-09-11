require File.expand_path('../frame', __dir__)

describe Frame do
  describe '#initialize' do
    context 'when sum of score is above 10' do
      subject { Frame.new(10, 1) }

      it 'should raise error' do
        expect{ subject }.to raise_error('score out of range: 11')
      end
    end

    context 'when sum of score is below 0' do
      subject { Frame.new(-1, 0) }

      it 'should raise error' do
        expect{ subject }.to raise_error('score out of range: -1')
      end
    end
  end

  describe '#strike?' do
    context 'when first score is not 10' do
      subject { Frame.new(0, 1).strike? }

      it 'should not be a strike' do
        expect(subject).to eql(false)
      end
    end

    context 'when first score is 10' do
      subject { Frame.new(10, 0).strike? }

      it 'should be a strike' do
        expect(subject).to eql(true)
      end
    end
  end

  describe '#spare?' do
    context 'when the sum of score is below 10' do
      subject { Frame.new(6, 2).spare? }

      it 'should not be a spare' do
        expect(subject).to eql(false)
      end
    end

    context 'when the sum of score is equal 10' do
      subject { Frame.new(6, 4).spare? }

      it 'should not be a spare' do
        expect(subject).to eql(true)
      end
    end
  end
end
