class Artist
  attr_accessor :name, :birth_year, :death_year

  def initialize(name="unknown", birth_year=-1, death_year=-1)
    @name = name
    @birth_year = birth_year
    @death_year = death_year
  end

  def print_info
    if @birth_year >= 0 && @death_year >= 0
      puts "Artist: #{@name} (#{@birth_year} to #{@death_year})"
    elsif @birth_year >= 0
      puts "Artist: #{@name} (#{@birth_year} to present)"
    else
      puts "Artist: #{@name} (unknown)"
    end
  end
end

class Artwork
  attr_accessor :title, :year_created, :artist

  def initialize(title="unknown", year_created=-1, artist=Artist.new)
    @title = title
    @year_created = year_created
    @artist = artist
  end

  def print_info
    @artist.print_info
    puts "Title: #{@title}, #{@year_created}"
  end
end
