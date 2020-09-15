require File.expand_path('spec_helper', __dir__)

describe GameParser do
  before do
    allow($stdin).to receive(:read).and_return(input_text)
  end

  subject { described_class.new }

  let(:input_text) do
    <<~INPUT_TEXT
    Jeff 10
    John 3
    John 7
    Jeff 7
    Jeff 3
    John 6
    John 3
    Jeff 9
    Jeff 0
    John 10
    Jeff 10
    John 8
    John 1
    Jeff 0
    Jeff 8
    John 10
    Jeff 8
    Jeff 2
    John 10
    Jeff F
    Jeff 6
    John 9
    John 0
    Jeff 10
    John 7
    John 3
    Jeff 10
    John 4
    John 4
    Jeff 10
    Jeff 8
    Jeff 1
    John 10
    John 9
    John 0
    INPUT_TEXT
  end

  describe '#parse' do
    before { subject.parse }

    it 'should parse the input in games' do
      expect(subject.players_scores).to eql({
        'Jeff' => [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 'F', 6, 10, 10, 10, 8, 1],
        'John' => [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0]
      })
    end
  end
end
