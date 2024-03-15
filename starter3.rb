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

