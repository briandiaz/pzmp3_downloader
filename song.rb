
class Song
	attr_accessor :artist, :name, :url

	def initialize(name, album, artist, genre, url)
		@name, @album, @artist, @genre, @url = name, album, artist, genre, url
	end

	def self.parse(args, song_url)
		name, album, artist, genre = args
		new(name, album, artist, genre, song_url)
	end

	def file_name
		"#{@artist} - #{@name}.mp3"
	end

	def to_s
		"#{@artist} - #{@name} [#{file_name}]"
	end
end
