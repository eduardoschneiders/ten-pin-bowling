require 'byebug'
require File.expand_path('../frame', __dir__)
require File.expand_path('../game', __dir__)

describe Game do
  describe '#calculate_score' do
    context 'with two simple frames' do
      let(:frame1) { Frame.new(5, 0) }
      let(:frame2) { Frame.new(4, 0) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(9)
      end
    end

    context 'with first frames with a spare' do
      let(:frame1) { Frame.new(8, 2) }
      let(:frame2) { Frame.new(4, 5) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(23)
      end
    end

    context 'with first frame with a strike' do
      let(:frame1) { Frame.new(10, nil) }
      let(:frame2) { Frame.new(4, 5) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(28)
      end
    end

    context 'with first and second frame with a strike' do
      let(:frame1) { Frame.new(10, nil) }
      let(:frame2) { Frame.new(10, nil) }
      let(:frame3) { Frame.new(7, 2) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(55)
      end
    end

    context 'with first and second frame with a strike, and third a spare' do
      let(:frame1) { Frame.new(10, nil) }
      let(:frame2) { Frame.new(10, nil) }
      let(:frame3) { Frame.new(7, 3) }
      let(:frame4) { Frame.new(1, 1) }
      let(:frames) { [frame1, frame2, frame3, frame4] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(60)
      end
    end
  end
end
