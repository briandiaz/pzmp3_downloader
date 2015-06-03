require 'spec_helper'
require 'pzmp3_downloader'

describe Downloader::Pzmp3 do 
	let(:album_url) { "http://pzmp3.com/music/album/3867/Death-Magnetic.html" }
	let(:song_url) { "http://pzmp3.com/music/song/33100/The-Day-That-Never-Comes-Metallica-mp3-song.html" }
	let(:invalid_song_url) { "http://pzmp3.com/music/song/" }

	subject(:downloader) { Downloader::Pzmp3.new }

	context "download a song" do
		it { subject.download(song_url).should eq(true) }
	end

	context "cannot download a song with invalid url" do
		it { subject.download(invalid_song_url).should eq("Url not valid") }
	end
 
	context "cannot download a song with empty url" do
		it { subject.download('').should eq("Url not valid") }
	end


end