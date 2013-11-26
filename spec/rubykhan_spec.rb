require 'spec_helper'

describe 'RubyKhan' do
  describe '.new' do
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topic/probability').
      to_return(body: fixture('probability.json'))
    end

    it "returns a KhanAcademy::Topic" do
      expect(KhanAcademy::Topic.new('probability')).to be_a KhanAcademy::Topic
    end
  end

  describe 'TopicTree' do
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree').
      to_return(body: fixture('topictree.json'))
    end

    it "returns a hash of topics" do
      all = KhanAcademy::TopicTree.new
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topictree')).to have_been_made
      expect(all.topics['cs']).to eq "programming"
    end
  end

  describe 'new topic' do
    before do
      stub_request(:get, 'http://www.KhanAcademy.org/api/v1/topic/probability').
      to_return(body: fixture('probability.json'))
    end

    it 'fetches a hash about the topic' do
      probability = KhanAcademy::Topic.new('probability')
      expect(a_request(:get, 'http://www.KhanAcademy.org/api/v1/topic/probability')).to have_been_made
      expect(probability.title).to eq "Probability and statistics"
    end
  end
end