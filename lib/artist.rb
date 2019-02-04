require "pry"

class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end

    def new_song(name, genre)
#to get a new song simply write the class Song with its arguments and
#the self relates to the artist, not to get confused with the class calling
#itself.
        Song.new(name, self, genre)
    end

    def songs
        Song.all.select do |song|
#iterates down into the song object and the select method gets the getter method
#"artist"which equals to self which is the artist instance and selects all the
#songs from that particular artist.
            song.artist == self
        end
    end

    def genres
        songs.map do |song|
#this method uses the "songs" method defined in line 23 and map iterates down
#to the song's attributes and in this case, it collects all the genres and
#puts them in a new array.
            song.genre
        end
    end

end


# binding.pry
# 0
