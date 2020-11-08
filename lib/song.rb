require 'pry'

class Song
  @@all = []
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end  

  def self.all
    @@all
  end  

  def self.new_by_filename(filename)
    filename = filename.split(" - ")
    song = self.new(filename[1])
    song.artist = Artist.find_or_create_by_name(filename[0])
    song
  end  

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
  end 

end  