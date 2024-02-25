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

RSpec.describe Artist do
  it 'creates an Artist with default values' do
    artist = Artist.new
    expect(artist.name).to eq("unknown")
    expect(artist.birth_year).to eq(-1)
    expect(artist.death_year).to eq(-1)
  end

  it 'prints the correct information for Claude Monet' do
    artist = Artist.new("Claude Monet", 1840, 1926)
    expect { artist.print_info }.to output("Artist: Claude Monet (1840 to 1926)\n").to_stdout
  end
end

RSpec.describe Artwork do
  it 'creates an Artwork with default values' do
    artwork = Artwork.new
    expect(artwork.title).to eq("unknown")
    expect(artwork.year_created).to eq(-1)
    expect(artwork.artist).to be_an_instance_of(Artist)
  end

  it 'prints the correct information for "Impression, Sunrise"' do
    artist = Artist.new("Claude Monet", 1840, 1926)
    artwork = Artwork.new("Impression, Sunrise", 1872, artist)
      Artist: Claude Monet (1840 to 1926)
      Title: Impression, Sunrise, 1872
    expect { artwork.print_info }.to output
  end
end
