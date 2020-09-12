require 'byebug'
require File.expand_path('../frame', __dir__)
require File.expand_path('../game', __dir__)
require File.expand_path('../game_builder', __dir__)

describe GameBuilder do
  describe '#build' do
    context '' do
      let(:scores) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1] }

      subject { GameBuilder.new(scores).build }

      it 'build all the frames' do
        expect(subject.frames[0]).to have_attributes(first_score: 10, second_score: 0, third_score: 0, last_frame: false)
        expect(subject.frames[1]).to have_attributes(first_score: 7, second_score: 3, third_score: 0, last_frame: false)
        expect(subject.frames[2]).to have_attributes(first_score: 9, second_score: 0, third_score: 0, last_frame: false)
        expect(subject.frames[3]).to have_attributes(first_score: 10, second_score: 0, third_score: 0, last_frame: false)
        expect(subject.frames[4]).to have_attributes(first_score: 0, second_score: 8, third_score: 0, last_frame: false)
        expect(subject.frames[5]).to have_attributes(first_score: 8, second_score: 2, third_score: 0, last_frame: false)
        expect(subject.frames[6]).to have_attributes(first_score: 0, second_score: 6, third_score: 0, last_frame: false)
        expect(subject.frames[7]).to have_attributes(first_score: 10, second_score: 0, third_score: 0, last_frame: false)
        expect(subject.frames[8]).to have_attributes(first_score: 10, second_score: 0, third_score: 0, last_frame: false)
        expect(subject.frames[9]).to have_attributes(first_score: 10, second_score: 8, third_score: 1, last_frame: true)
      end

      it 'calculate the score' do
        expect(subject.calculate_score).to eql(167)
      end
    end
  end
end
