require 'spec_helper'

describe 'RubyKhan' do
	describe '.new' do
    
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topic/probability').
      to_return(body: fixture('probability.json'))
      probability = KhanAcademy::Topic.get_info('probability')
    end

    it "makes an API request" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topic/probability')).to have_been_made
    end

    it "returns a KhanAcademy::Topic" do
      expect(probability).to be_a KhanAcademy::Topic
    end

    it "returns an object with attributes" do
      expect(probability.title).to eq "Probability and statistics"
		end

	end

  describe 'KhanAcademy::Topic.all' do
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree').
      to_return(body: fixture('topictree.json'))
    end

    it "makes an api request" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree')).to have_been_made
    end

    it "returns an array of topics" do
      all = KhanAcademy::Topic.all
      expect(all).to be_a Array
    end
  end

  describe "KhanAcademy::Playlist.get_videos" do
    before do
      stub_request(:get, "http://www.KhanAcademy.org/api/v1/playlists/blood-vessels/videos").
      to_return(body: fixture('videos.json'))
      blood_vessels = KhanAcademy::Playlist.get_videos('blood-vessels')
    end

    it "instantiates an array of playlist objects" do
      blood_vessels = KhanAcademy::Playlist.get_videos('blood-vessels')
      expect blood_vessels.to be_a Array.new
      expect blood_vessels.first.to be_a KhanAcademy::Playlist
    end

    it "makes an api call" do
      blood_vessels = KhanAcademy::Playlist.get_videos('blood-vessels')
      expect (a_request(:get, 'http://www.KhanAcademy.org/api/v1/playlists/blood-vessels/videos')).to have_been_made
    end

    it "returns an object whose attributes can be accessed with ruby methods" do
      blood_vessels = KhanAcademy::Playlist.get_videos('blood-vessels')
      expect blood_vessels.first.duration.to eq 897
    end
  end

end