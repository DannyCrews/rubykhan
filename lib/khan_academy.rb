
require 'pry'
require 'httparty'

module KhanAcademy
end

class KhanAcademy::TopicTree
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

class KhanAcademy::Topic
	attr_reader :topic_slug, :data, :url, :id, :children, :slug, :kind, :tags, :url, :title, :node_slug
	def initialize(topic_slug)
		@topic_slug = topic_slug
		@data = HTTParty.get("http://www.KhanAcademy.org/api/v1/topic/#{@topic_slug}")
    @url = @data['ka_url']
    @id = @data['id']
    @children = @data['children']
    @slug = @data['slug']
    @kind = @data['kind']
    @tags = @data['tags']
    @url = @data['url']
    @title = @data['title']
    @node_slug = @data['node_slug']
  end

  def subtopics
  	@children.map do |child|
  		{kind: child['kind'],
  		 url: child['url'],
  		 id: child['id'],
  		 node_slug: child['node_slug'],
  		 title: child['title']}
  	end
  end
end

# class KhanAcademy::Topic
# 	attr_reader :response

# 	def initialize(topic_slug)
# 		@topic_slug = topic_slug
# 		@response = HTTParty.get("http://www.KhanAcademy.org/api/v1/topic/#{@topic_slug}")
# 	end

# 	def title
#   	@response['title']
#   end

#   def kind
#   	@response['kind']
#   end

#   def standalone_title
#     @response['standalone_title']
#   end

# 	def description
# 		@response['description']
# 	end

# 	def slug
# 		@response['slug']
# 	end

# 	def node_slug
# 		@response['node_slug']
# 	end

# 	def extended_slug
# 		@response['extended_slug']
# 	end

# 	def facebook_url
# 		@response['facebook_url']
# 	end

# 	def twitter_url
# 		@response['twitter_url']
# 	end

# 	def web_url
# 		@response['web_url']
# 	end

# 	def ka_url
# 		@response['ka_url']
# 	end

# 	def url
# 		@response['url'] || @response['ka_url'] || @response['web_url']
# 	end

# 	def topic_page_url
# 	  @response['topic_page_url']
# 	end

# 	def subtopics_count
# 		@response.children.count
# 	end

# 	def parent_topic
# 		@response['domain_slug']
# 	end

# 	def icon_src
# 		@response['icon_src']
# 	end

#   def subtopics
#     @response['children'].map do |topic|
#     	{title: topic['title'],
#     	url: topic['url'],
#       internal_id: topic['internal_id'],
#       node_slug: topic['node_slug'],
#       translated_title: topic['translated_title'],
#       id: topic['id'],
#       kind: topic['kind']}
#     end
#   end

# end
algebra = KhanAcademy::Topic.new('algebra')
binding.pry
