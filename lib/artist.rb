class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.save
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def save
    @@all << self
  end

  def songs
    Song.all.select{|song| song.artist == self}
  end

  def print_songs
    self.songs.each{|song| puts song.name}
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find{|artist| artist.name == name}
    if artist
      return artist
    else
      return Artist.new(name)
    end
  end
end
