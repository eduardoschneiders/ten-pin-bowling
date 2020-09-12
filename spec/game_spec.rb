require 'byebug'
require File.expand_path('../frame', __dir__)
require File.expand_path('../game', __dir__)

describe Game do
  describe '#calculate_score' do
    context 'with two simple frames' do
      let(:frame1) { Frame.new(first_score: 5, second_score: 0) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 0) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(9)
      end
    end

    context 'with first frames with a spare' do
      let(:frame1) { Frame.new(first_score: 8, second_score: 2) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 5) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(23)
      end
    end

    context 'with first frame with a strike' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 5) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(28)
      end
    end

    context 'with first and second frame with a strike' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 7,  second_score: 2) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(55)
      end
    end

    context 'with first and second frame with a strike, and third a spare' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 7, second_score: 3) }
      let(:frame4) { Frame.new(first_score: 1, second_score: 1) }
      let(:frames) { [frame1, frame2, frame3, frame4] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(60)
      end
    end

    context 'with first, second and last frame with a strike,' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 10, second_score: 10,third_score: 10, last_frame: true) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(90)
      end
    end

    context 'with first, second and last frame with a strike,' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 8,  second_score:2, third_score: 4) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(62)
      end
    end

    context 'with first, second and last frame with a strike,' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 8,second_score: 2, third_score: 9) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames).calculate_score }

      it 'calculate the score' do
        expect(subject).to eql(39)
      end
    end
  end
end
