require 'spec_helper'

describe 'RubyKhan' do

	describe '.new' do
    
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topics/probability').
      to_return(body: fixture('probability.json'))
      @probability = KhanAcademy::Topic.get_info('probability')
    end

    it "makes an API request" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topics/probability')).to have_been_made
    end

    it "returns a KhanAcademy::Topic" do
      expect(@probability).to be_a KhanAcademy::Topic
    end

    it "returns an object with attributes" do
      expect(@probability.title).to eq "Probability and statistics"
		end

	end

  describe 'KhanAcademy::Topic.tree' do
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree').
      to_return(body: fixture('topictree.json'))
      @topictree = KhanAcademy::Topic.tree
    end

    it "makes an api request" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree')).to have_been_made
    end

  end

  describe 'KhanAcademy::Topic.all' do
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree').
      to_return(body: fixture('topictree.json'))
      @all = KhanAcademy::Topic.all
    end

    it "makes an api request" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree')).to have_been_made
    end

    it "returns an array of topics" do
      expect(@all).to be_a Array
    end

  end

  describe "KhanAcademy::Topic.get_videos" do
    before do
      stub_request(:get, "http://www.KhanAcademy.org/api/v1/topics/blood-vessels/videos").
      to_return(body: fixture('videos.json'))
      @blood_vessels = KhanAcademy::Topic.get_videos('blood-vessels')
    end

    it "instantiates an array of playlist objects" do
      expect(@blood_vessels).to be_a Array
      expect(@blood_vessels.first).to be_a KhanAcademy::Topic
    end

    it "makes an api call" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topics/blood-vessels/videos')).to have_been_made
    end

    it "returns an object whose attributes can be accessed with ruby methods" do
      expect(@blood_vessels.first.duration).to eq 897
    end
  end

  describe "KhanAcademy::Topic.get_exercises" do
    before do
      stub_request(:get, "http://www.KhanAcademy.org/api/v1/playlists/buddhist-art/exercises").
      to_return(body: fixture('exercises.json'))
      @buddhist_art = KhanAcademy::Topic.get_exercises('buddhist-art')
    end

    it "instantiates an array of playlist objects" do
      expect(@buddhist_art).to be_a Array
      expect(@buddhist_art.first).to be_a KhanAcademy::Topic
    end

    it "makes an api call" do
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/playlists/buddhist-art/exercises')).to have_been_made 
    end

    it "returns an object whose attributes can be accessed with ruby methods" do
      expect(@buddhist_art.first.author_name).to eq "Beth"
    end
  end

end