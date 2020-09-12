require 'byebug'
require File.expand_path('../frame', __dir__)
require File.expand_path('../game', __dir__)
require File.expand_path('../game_builder', __dir__)
require File.expand_path('../game_player_serializer', __dir__)

describe GamePlayerSerializer do
  describe '#build' do
    context '' do
      let(:scores) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 'F', 6, 10, 10, 10, 8, 1] }
      let(:game) { GameBuilder.new(scores).build }

      subject { GamePlayerSerializer.new(game: game, player_name: 'Eduardo').output }
      let(:out) do
        <<~OUT
        Eduardo
        Pinfalls\t\tX\t7\t\/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1
        Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167
        OUT
      end

      it 'build all the frames' do
        expect{ subject }.to output(out).to_stdout
      end
    end
  end
end
