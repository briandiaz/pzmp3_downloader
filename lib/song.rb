
class Song
	attr_accessor :artist, :name, :url, :genre, :album

	def initialize(name, album, artist, genre, url)
		@name, @album, @artist, @genre, @url = name, album, artist, genre, url
	end

	def self.parse(args, song_url)
		name, album, artist, genre = self.remove_prohibited_chars(args)
		new(name, album, artist, genre, song_url)
	end

	def file_name
		"#{@artist} - #{@name}.mp3"
	end

	def to_s
		"#{@artist} - #{@name} [#{file_name}]"
	end

	private

		def self.remove_prohibited_chars(args)
			args.map{ |arg| arg.gsub(/\//," ") }
		end
end
