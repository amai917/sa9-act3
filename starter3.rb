class Team
  attr_accessor :name, :wins, :losses

  def initialize
    @name = "none"
    @wins = 0
    @losses = 0
  end

  def get_win_percentage
    (@wins.to_f / (@wins + @losses)).round(2)
  end

  def print_standing
    win_percentage = get_win_percentage
    puts "Win percentage: #{'%.2f' % win_percentage}"
    if win_percentage >= 0.5
      puts "Congratulations, Team #{@name} has a winning average!"
    else
      puts "Team #{@name} has a losing average."
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  team = Team.new
  team.name = gets.chomp
  team.wins = gets.to_i
  team.losses = gets.to_i
  team.print_standing
end

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
    expected_output = "Win percentage: 1.00\nCongratulations, Team Sharks has a winning average!\n"
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
      expected_output = "Win percentage: 0.17\nTeam Sharks has a losing average.\n"
      expect { @team.print_standing }.to output(expected_output).to_stdout
    end
  end
end
