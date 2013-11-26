# require 'rubykhan/client'

# module Rubykhan
#   class << self
#     # attr_accessor :key
#     def configure
#       yield self
#     end

#     def new
#     end

#     def method_missing(method, *args, &block)
#       return super unless new.respond_to?(method)
#       new.send(method, *args, &block)
#     end

#     def respond_to?(method, include_private=false)
#       new.respond_to?(method, include_private) || super(method, include_private)
#     end
#   end
# end
require 'pry'
require 'httparty'
require 'json'

module KhanAcademy


	class TopicTree
		attr_reader :topictree

	  def initialize
	  	@topictree = HTTParty.get('http://www.khanacademy.org/api/v1/topictree')
	  end

	  def topics
	    @main_topics = @topictree['children'].map { |topic| topic['slug']}	
	  	topics = {}
	  	@main_topics.each_with_index do |topic, index|
	      topics[topic] = @topictree['children'][index]['children'].map {|subtopic| subtopic['slug']}
	    end
	    return topics
	  end

	end


	class Topic
		attr_reader :json

		def initialize(topic_slug)
			@topic_slug = topic_slug
			@json = HTTParty.get("http://www.KhanAcademy.org/api/v1/topic/#{@topic_slug}")
		end

		def title
	  	@json['title']
	  end

	  def children
	  	@json['children']
	  end

	  def kind
	  	@json['kind']
	  end

	  def standalone_title
	    @json['standalone_title']
	  end

		def description
			@json['description']
		end

		def slug
			@json['slug']
		end

		def node_slug
			@json['node_slug']
		end

		def extended_slug
			@json['extended_slug']
		end

		def facebook_url
			@json['facebook_url']
		end

		def twitter_url
			@json['twitter_url']
		end

		def web_url
			@json['web_url']
		end

		def ka_url
			@json['ka_url']
		end

		def url
			@json['url'] || @json['ka_url'] || @json['web_url']
		end

		def topic_page_url
		  @json['topic_page_url']
		end

		def subtopics_count
			@json.children.count
		end

		def parent_topic
			@json['domain_slug']
		end

		def icon_src
			@json['icon_src']
		end

	  def subtopics
	    @json['children'].map do |topic|
	    	{title: topic['title'],
	    	url: topic['url'],
	      internal_id: topic['internal_id'],
	      node_slug: topic['node_slug'],
	      translated_title: topic['translated_title'],
	      id: topic['id'],
	      kind: topic['kind']}
	    end
	  end

	end
end