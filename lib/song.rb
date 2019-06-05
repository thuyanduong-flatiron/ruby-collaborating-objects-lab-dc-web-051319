class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename(filename)
    arr = filename.split(" - ")
    song = Song.new(arr[1])
    song.artist = Artist.find_or_create_by_name(arr[0])
    song
  end
end
