require 'pry'

class Song
  attr_accessor :name, :artist_name, :song
  @@all = []

  def initialize(name, song)
    @name = name
    @song = song
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      nsong = Song.new(name, nsong)
      nsong.save 
      nsong 
  end

  def self.new_by_name(name)
   song = Song.new(name, song) 
   #binding.pry
  end
  
  def self.create_by_name(name)
    nsong = Song.new_by_name(name)
    nsong.save
    nsong
  end

  def self.find_by_name(name)
    @@all.find {|songs| songs.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else 
      Song.create_by_name(name)
    end   
  end 

  def self.alphabetical
    Song.all.sort_by {|songs| songs.name}
  end 
#binding.pry 

  def self.new_from_filename(file)
    arr = file.split(/[\-.]/)
    name = arr[1].strip
    song = self.find_or_create_by_name(name)
    song.artist_name = arr[0].strip
    song 
  end

  def self.create_from_filename(file)
    Song.new_from_filename(file)
  end

  def self.destroy_all
    @@all.clear
  end

end 


