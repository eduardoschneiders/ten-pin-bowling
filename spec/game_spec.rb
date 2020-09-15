require File.expand_path('spec_helper', __dir__)

describe Game do
  describe '#calculate_score' do
    context 'with two simple frames' do
      let(:frame1) { Frame.new(first_score: 5, second_score: 0) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 0) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([5, 9])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(9)
      end
    end

    context 'with first frames with a spare' do
      let(:frame1) { Frame.new(first_score: 8, second_score: 2) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 5) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([14, 23])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(23)
      end
    end

    context 'with first frame with a strike' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 5) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([19, 28])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(28)
      end
    end

    context 'with first and second frame with a strike' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 7,  second_score: 2) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([27, 46, 55])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(55)
      end
    end

    context 'with first and second frame with a strike, and third a spare' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 7, second_score: 3) }
      let(:frame4) { Frame.new(first_score: 1, second_score: 1) }
      let(:frames) { [frame1, frame2, frame3, frame4] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([27, 47, 58, 60])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(60)
      end
    end

    context 'with first, second and last frame with a strike,' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 10, second_score: 10,third_score: 10, last_frame: true) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([30, 60, 90])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(90)
      end
    end

    context 'with first and second frame with a strike,' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 10) }
      let(:frame3) { Frame.new(first_score: 8,  second_score:2, third_score: 4) }
      let(:frames) { [frame1, frame2, frame3] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([28, 48, 62])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(62)
      end
    end

    context 'with first frame with a strike,' do
      let(:frame1) { Frame.new(first_score: 10) }
      let(:frame2) { Frame.new(first_score: 8, second_score: 2, third_score: 9) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([20, 39])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(39)
      end
    end

    context 'with first frame with one foul' do
      let(:frame1) { Frame.new(first_score: false, second_score: 8) }
      let(:frame2) { Frame.new(first_score: 8, second_score: 2) }

      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([8, 18])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(18)
      end
    end

    context 'with second frame with one foul' do
      let(:frame1) { Frame.new(first_score: 2, second_score: 8) }
      let(:frame2) { Frame.new(first_score: false, second_score: 2) }

      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'create the frame scores' do
        subject.calculate_score
        expect(subject.frame_scores).to eql([10, 12])
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(12)
      end
    end
  end

  describe '#validate!' do
    context 'when sum of score is below 0' do
      let(:frame1) { Frame.new(first_score: -1, second_score: 0) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 0) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'should raise error' do
        expect { subject.validate! }.to raise_error('score out of range: -1')
      end
    end

    context 'with two simple frames' do
      let(:frame1) { Frame.new(first_score: 5, second_score: 0) }
      let(:frame2) { Frame.new(first_score: 4, second_score: 0) }
      let(:frames) { [frame1, frame2] }

      subject { Game.new(frames) }

      it 'should not raise error' do
        expect{ subject.validate! }.not_to raise_error
      end
    end
  end
end
