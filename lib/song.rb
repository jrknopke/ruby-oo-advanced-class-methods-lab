class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = self.new
    song.save
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
  end

  def self.find_by_name(name)
    @@all.find do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(filename)
    x = self.new_from_filename(filename)
    song = self.create
    song.name = x.name
    song.artist_name = x.artist_name
    song
  end

  def save
    self.class.all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

end
