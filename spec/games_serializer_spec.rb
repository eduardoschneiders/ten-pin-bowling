require File.expand_path('spec_helper', __dir__)

describe GamesSerializer do
  describe '#build' do
    context 'with one player' do
      let(:player_1_scores) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 'F', 6, 10, 10, 10, 8, 1] }
      let(:player_1_game) { GameBuilder.new(player_1_scores).build }

      let(:games) do
        [
          { game: player_1_game, player_name: 'Eduardo'}
        ]
      end

      subject { GamesSerializer.new(games: games).output }

      let(:out) do
        <<~OUT
        Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10
        Eduardo
        Pinfalls\t\tX\t7\t\/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1
        Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167
        OUT
      end

      it 'prints the game scores' do
        expect{ subject }.to output(out).to_stdout
      end
    end

    context 'with two player' do
      let(:player_1_scores) { [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 'F', 6, 10, 10, 10, 8, 1] }
      let(:player_1_game) { GameBuilder.new(player_1_scores).build }

      let(:player_2_scores) { [3, 7, 6, 3, 10, 8, 1, 10, 10, 9, 0, 7, 3, 4, 4, 10, 9, 0] }
      let(:player_2_game) { GameBuilder.new(player_2_scores).build }

      let(:games) do
        [
          { game: player_1_game, player_name: 'Eduardo'},
          { game: player_2_game, player_name: 'Jhon'}
        ]
      end

      subject { GamesSerializer.new(games: games).output }

      let(:out) do
        <<~OUT
        Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10
        Eduardo
        Pinfalls\t\tX\t7\t\/\t9\t0\t\tX\t0\t8\t8\t/\tF\t6\t\tX\t\tX\tX\t8\t1
        Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167
        Jhon
        Pinfalls\t3\t\/\t6\t3\t\tX\t8\t1\t\tX\t\tX\t9\t0\t7\t\/\t4\t4\tX\t9\t0
        Score\t\t16\t\t25\t\t44\t\t53\t\t82\t\t101\t\t110\t\t124\t\t132\t\t151
        OUT
      end

      it 'prints the games score' do
        expect{ subject }.to output(out).to_stdout
      end
    end
  end
end
