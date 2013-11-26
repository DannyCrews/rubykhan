
# 	class Topic
# 		attr_reader :topic_slug, :data, :url, :id, :children, :slug, :kind, :tags, :url, :title, :node_slug, :subtopics
# 		def initialize(topic_slug)
# 			@topic_slug = topic_slug
# 			@data = HTTParty.get("http://www.KhanAcademy.org/api/v1/topic/#{@topic_slug}")
# 	    @ka_url = @data['ka_url']
# 	    @id = @data['id']
# 	    @children = @data['children']
# 	    @slug = @data['slug']
# 	    @kind = @data['kind']
# 	    @tags = @data['tags']
# 	    @url = @data['url']
# 	    @title = @data['title']
# 	    @node_slug = @data['node_slug']
# 	    @internal_id = data['internal_id']
# 	    @url = data['url']
# 	    @node_slug = data['node_slug']
# 	    @edit_slug = data['edit_slug']
# 	    @key = data['key']
# 	    @translated_title = data['translated_title']
# 	    if data['children']
# 		    @children = data['children']
# 		    @subtopics = []
# 		    @videos = []
# 		    @exercises = []
# 		    instantiate_subtopics
# 	    end

# 	  end

# 	  private

# 	  def instantiate_subtopics

# 	  	@children.each do |child|
# 	  		case child['kind'] 
# 	  		when "Topic"
#           begin
#             @subtopics << KhanAcademy::Topic.new(child['id'])
#           rescue
#           	@subtopics << KhanAcademy::Subtopic.new(child)
#           end
# 	  		when "Video"
# 	  			@videos << KhanAcademy::Video.new(child)
# 	  		when "Exercise"
# 	  			@exercises << KhanAcademy::Exercise.new(child)
# 	  		end
# 	  	end
# 	  end
# 	end

# 	class Subtopic
# 		attr_reader :data, :kind, :internal_id, :title, :url, :node_slug, :edit_slug, :key, :translated_title, :id
# 		def initialize(data)
# 			@data = data
# 	    @kind = data['kind']
# 	    @internal_id = data['internal_id']
# 	    @title = data['title']
# 	    @url = data['url']
# 	    @node_slug = data['node_slug']
# 	    @edit_slug = data['edit_slug']
# 	    @key = data['key']
# 	    @translated_title = data['translated_title']
# 	    @id = data['id']
# 	  end

# 	end

#   class Video
#   	def initialize(data)
#   		@kind = data['kind']
#   		@internal_id = data['internal_id']
#   		@title = data['title']
#   		@url = data['url']
#   		@node_slug = data['node_slug']
#   		@edit_slug = data['edit_slug']
#   		@key = data['key']
#   		@translated_title = data['translated_title']
#   		@id = data['id']
#   	end
#   end

#   class Exercise
#   	def initialize(data)
#   		@kind = data['kind']
#   		@internal_id = data['internal_id']
#   		@title = data['title']
#   		@url = data['url']
#   		@node_slug = data['node_slug']
#   		@edit_slug = data['edit_slug']
#   		@key = data['key']
#   		@translated_title = data['translated_title']
#   		@id = data['id']
#   	end
#   end

# end


