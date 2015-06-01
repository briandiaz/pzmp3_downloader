require 'nokogiri'
require 'open-uri'
require_relative 'song'

module Downloader
	class Pzmp3

		# Get html document by making a request to the url
		# with nokogiri
		def get_html_doc(url)
			Nokogiri::HTML(open(url))
		end

		# Return a list of links of songs that an album url contains
		def get_album_songs_url(album_url)
			html_doc = get_html_doc(album_url)
			links = html_doc.css('a')
			links.map {|link| (link.attribute('href').to_s =~ /mp3-song.html/) ? "http://pzmp3.com/"+link.attribute('href').to_s : ""}.sort.delete_if{|href| href.empty?}
		end

		# Parse a Song instance from a url
		def parse_song(song_url)
			html_doc = get_html_doc(song_url)
			song_info = html_doc.css('table table').css('tr td').map{ |data| data.text.split(':')[1].sub!(" ", "") }
			song_url = get_128kbps_mp3_url(html_doc)
			Song.parse(song_info, song_url)
		end

		# Return the 128kbps Mp3 file from an specific html doc from a song url
		def get_128kbps_mp3_url(html_doc)
			links = html_doc.css('a')
			mp3_urls = links.map {|link| (link.attribute('href').to_s.include? ".mp3") ? link.attribute('href').to_s : ""}.delete_if{|href| href.empty?}
			mp3_urls.last
		end

		# Download the song
		def download(song_url)
			song = parse_song(song_url)
			song_path = (@album_path) ? @album_path + "/" + song.file_name : song.file_name
			web_file = open(song.url)
			if web_file.status[0] == "200"
				puts "Downloading #{song} ..."
				File.open(song_path,'wb') do |data|
					data.write web_file.read
				end
				puts "#{song} successfully downloaded!"
			else
				"Problems downloading file"
			end
		end

		# Download all songs of a album specified by an url.
		def download_album(url)
			create_album_path(url)
			songs = get_album_songs_url(url)
			songs.each do |song|
				download song
			end
		end

		private
			# Creates the album path
			def create_album_path(url)
				@album_path = url.split('/').last.gsub!(/-|mp3|songs|.html/,"").strip
				Dir.mkdir @album_path unless File.exists?(@album_path)
			end

	end		
end