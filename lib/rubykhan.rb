require 'httparty'
require 'json'

module KhanAcademy

	class Topic

		include HTTParty
		base_uri 'http://www.KhanAcademy.org/api/v1'

		format :json
		
		# constrain to Topic attributes?
		@@attributes = [:icon_src, :domain_slug, :relative_url, :web_url, :ka_url, :translated_standalone_title, :translated_title, :gplus_url, :id, :old_key_name, :hide, :title, :child_data, :children, :twitter_url, :translated_description, :deleted_mod_time, :logo_image_url, :in_knowledge_map, :description, :x_pos, :node_slug, :deleted, :facebook_url, :backup_timestamp, :render_type, :background_image_url, :background_image_caption, :assessment_progress_key, :topic_page_url, :extended_slug, :slug, :tags, :kind, :in_topic_browser, :sha, :standalone_title, :y_pos, :current_revision_key, :content_kind, :translated_short_display_name, :assessment_items, :relative_url, :file_name, :author_name, :creation_date, :uses_assessment_items, :all_assessment_item_keys, :ka_url, :v_position, :translated_title, :translated_description_html, :display_name, :tracking_document_url, :tags, :summative, :live, :pretty_display_name, :translated_pretty_display_name, :problem_types, :curated_related_videos, :covers, :h_position, :translated_display_name, :sha1, :name, :prerequisites, :assessment_item_tags, :seconds_per_fast_problem, :short_display_name, :tutorial_only, :current_revision_key, :image_url_256, :content_ki, :translated_youtube_id, :has_questions, :keywords, :duration, :id, :description_html, :title, :progress_key, :edit_slug, :author_names, :deleted_mod_time, :description, :extra_properties, :node_slug, :deleted, :backup_timestamp, :date_added, :download_urls, :translated_youtube_lang, :kind, :url, :ka_user_license, :global_id, :sha, :translated_description, :image_url, :youtube_id, :position, :content_kind, :readable_id]
		@@attributes.each {|attr| attr_accessor attr}

		def initialize(options)

			@@attributes.each do |a|
				instance_variable_set('@'+a.to_s, options[a.to_s])
			end

			# TODO MOVE TO OTHER CLASS
			# :user => username
			# :password => oathoken etc.
			# @options = options
		end

		# TODO instance.children

		# a = KhanAcademy::Topic.retrieve("algebra")
		def self.retrieve(topic)
			begin
				options = self.get("/topic/#{topic}")
				return new(options)
			rescue JSON::ParserError
				# very likely -> 404 not found
				return nil
			end
		end

		# a.videos
		def videos
			Topic.get_videos(slug)
		end

		# a = KhanAcademy::Topic.get_videos("blood-vessels")
		def self.get_videos(topic)
			options = self.get("/topic/#{topic}/videos")
			options.collect {|json| new(json)}
			# should return video classes
		end

		def exercises
			Topic.get_exercises(slug)
		end

		def self.get_exercises(topic)
			options = self.get("/playlists/#{topic}/exercises")
			options.collect {|json| new(json)}
			# should return exercise classes
		end

	end

	class TopicTree

		# INCLUDE STUFF HERE


		# does not belong in Topic
		#def self.all(key = "extended_slug")
			#uri = "/api/v1/topictree"
			#options = self.class.get(uri).to_hash
			#values(options, key)
		#end
		
		# does not belong in Topic
		#def self.tree
			#self.class.get("/topictree")
		#end

		private

		# -> does not belong in Topic
			def values(hsh, key)
			  return [] if !hsh.kind_of? Hash
			  v = hsh[key] ? [hsh[key]] : []
			  hsh.values.select{|i| i.kind_of? Hash or i.kind_of? Array}.each do |val|
			    if val.kind_of? Hash
			      v+= values(val, key)
			    else
			      val.each {|i| v+= values(i, key)}
			    end
			  end
			  return v
			end
	end

end
