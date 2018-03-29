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
    self.new.tap{|song| song.save}
  end
  
  def self.new_by_name(song_name)
    self.new.tap{|song| @name = song.name}
  # new_song = self.new 
   # @name = song_name
   # new_song.name = @name
   # return new_song
  end
  
  def self.create_by_name(song_name)
    self.new_by_name(song_name).tap{|song| song.save}
  end
  
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name 
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    @@all.sort_by{|song| song.name}
end
  
  def self.new_from_filename(file_name)
    array = []
  array << file_name.split("-")
  artist_space = array[0][0]
 no_space = artist_space.scan(/.+\S/).join
  @artist_name = no_space 
  mp3 = array[0][1]
  no_mp3 = mp3.scan(/\S+[^".mp3"]/).join 
   @name = no_mp3
   new_file = self.new 
   new_file.name = @name 
   new_file.artist_name = @artist_name
   return new_file
end

def self.create_from_filename(file_name)
  array = []
  array << file_name.split("-")
  artist_space = array[0][0]
 no_space = artist_space.scan(/.+\S/).join
  @artist_name = no_space 
  mp3 = array[0][1]
  no_mp3 = mp3.scan(/\S+[^".mp3"]/).join 
   @name = no_mp3
   new_file = self.new 
   new_file.name = @name 
   new_file.artist_name = @artist_name
   new_file.save
end

def self.destroy_all
  self.all.clear
end

end
