require_relative 'starter3'

RSpec.describe Team do
  before :each do
    @team = Team.new
    @team.name = "UofMYelpers"
    @team.wins = 10
    @team.losses = 0
  end

  it 'calculates win percentage correctly' do
    expect(@team.get_win_percentage).to eq(1.00)
  end

  it 'prints the correct winning standing' do
    expected_output = "Win percentage: 1.00\nCongratulations, Team UofMYelpers has a winning average!\n"
    expect { @team.print_standing }.to output(expected_output).to_stdout
  end

  context 'when the team has a losing average' do
    before do
      @team.wins = 2
      @team.losses = 10
    end

    it 'calculates win percentage correctly' do
      expect(@team.get_win_percentage).to be < 0.5
    end

    it 'prints the correct losing standing' do
      expected_output = "Win percentage: 0.17\nTeam UofMYelpers has a losing average.\n"
      expect { @team.print_standing }.to output(expected_output).to_stdout
    end
  end
end
