require 'spec_helper'
require 'song'

describe Song do 

	let(:song_name){ "Like A Pimp" }
	let(:album_name){ "Welcome 2 Tha Chuuch" }
	let(:artist_name){ "Snoop Dogg" }
	let(:genre_name){ "Hip Hop Music" }
	let(:link){ "http://pzmp3.com/music/song/32362/Like-A-Pimp-Snoop-Dogg-mp3-song.html" }

	let(:song){ Song.new song_name, album_name, artist_name, genre_name, link }

	subject{ song }	

	context "creation" do

		it { should respond_to(:name) }
		it { should respond_to(:artist) }
		it { should respond_to(:album) }
		it { should respond_to(:genre) }
		it { should respond_to(:url) }

		it "is named Like A Pimp" do 
			subject.name.should == song_name
		end
		it "its album name is Welcome 2 Tha Chuuch" do 
			subject.album.should == album_name
		end
		it "its artist name is Snoop Dogg" do 
			subject.artist.should == artist_name
		end
		it "its artist name is Hip Hop Music" do 
			subject.genre.should == genre_name
		end

	end

	context "#file_name" do
		it { subject.file_name.should eq("Snoop Dogg - Like A Pimp.mp3")}
	end

	context "#to_s" do
		it { subject.to_s.should eq("#{artist_name} - #{song_name} [#{subject.file_name}]")}
	end

end