require_relative 'starter1'

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
        expect { artwork.print_info }.to output("Artist: Claude Monet (1840 to 1926)\nTitle: Impression, Sunrise, 1872\n").to_stdout
    end
end
