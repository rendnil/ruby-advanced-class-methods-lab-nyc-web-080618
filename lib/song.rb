class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end

  def self.new_by_name(song_name)
      new_song = self.new
      new_song.name = song_name
      new_song

  end

  def self.create_by_name(song_name)
      new_song = self.new
      new_song.name = song_name
      new_song.save
      new_song
  end

  def self.find_by_name(song_name)
      self.all.find do |song|
        song.name == song_name
      end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical

    self.all.sort_by{|song| song.name}

  end

  def self.new_from_filename(filename)
      new_song = self.new
      new_song.name = filename.split(" - ")[1].chomp(".mp3")
      new_song.artist_name = filename.split(" - ")[0]
      new_song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end


end
