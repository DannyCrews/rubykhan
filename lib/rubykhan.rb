require 'httparty'
require 'json'

module KhanAcademy

	class Khanable

		include HTTParty
		base_uri 'http://www.KhanAcademy.org/api/v1'
		format :json

		# TODO move @@attributes stuff here properly
		@@attributes = []
		@@attributes.each {|attr| attr_accessor attr}

		def initialize(options)
			begin
				@@attributes.each do |a|
					instance_variable_set('@'+a.to_s, options[a.to_s])
				end
			rescue JSON::ParserError
				# very likely -> 404 not found
				return nil
			end
		end

		private

			def self.get_data(url)
				response = self.get(url)
				return response unless response.code == 404
				return {} # fail silently
				# TODO retry
				# TODO handle other errors
			end

	end

	class Topic < Khanable

		# TODO: constrain to Topic attributes
		@@attributes = [:icon_src, :domain_slug, :relative_url, :web_url, :ka_url, :translated_standalone_title, :translated_title, :gplus_url, :id, :old_key_name, :hide, :title, :child_data, :children, :twitter_url, :translated_description, :deleted_mod_time, :logo_image_url, :in_knowledge_map, :description, :x_pos, :node_slug, :deleted, :facebook_url, :backup_timestamp, :render_type, :background_image_url, :background_image_caption, :assessment_progress_key, :topic_page_url, :extended_slug, :slug, :tags, :kind, :in_topic_browser, :sha, :standalone_title, :y_pos, :current_revision_key, :content_kind, :translated_short_display_name, :assessment_items, :relative_url, :file_name, :author_name, :creation_date, :uses_assessment_items, :all_assessment_item_keys, :ka_url, :v_position, :translated_title, :translated_description_html, :display_name, :tracking_document_url, :tags, :summative, :live, :pretty_display_name, :translated_pretty_display_name, :problem_types, :curated_related_videos, :covers, :h_position, :translated_display_name, :sha1, :name, :prerequisites, :assessment_item_tags, :seconds_per_fast_problem, :short_display_name, :tutorial_only, :current_revision_key, :image_url_256, :content_ki, :translated_youtube_id, :has_questions, :keywords, :duration, :id, :description_html, :title, :progress_key, :edit_slug, :author_names, :deleted_mod_time, :description, :extra_properties, :node_slug, :deleted, :backup_timestamp, :date_added, :download_urls, :translated_youtube_lang, :kind, :url, :ka_user_license, :global_id, :sha, :translated_description, :image_url, :youtube_id, :position, :content_kind, :readable_id]
		@@attributes.each {|attr| attr_accessor attr}

		# a = KhanAcademy::Topic.retrieve("algebra")
		def self.retrieve(topic)
			options = self.get_data("/topic/#{topic}")
			return new(options)
		end

		def self.all(key = "extended_slug")
			tree = Topic.values(self.get_data("/topictree").to_hash,key)
		end

		# SystemStackError: stack level too deep
			# from /usr/lib/ruby/1.9.1/irb/workspace.rb:80
		# Maybe IRB bug!
		# Sigh~ >>>
		def children
			return child_data.collect {|json| new(json)} if child_data!=nil
			[]
		end

		# a = KhanAcademy::Topic.get_videos("blood-vessels")
		def self.get_videos(topic)
			options = self.get_data("/topic/#{topic}/videos")
			options.collect {|json| Video.new(json)}
		end

		# a.videos
		def videos
			Topic.get_videos(slug)
		end

		def self.get_exercises(topic)
			options = self.get_data("/playlists/#{topic}/exercises")
			options.collect {|json| Exercise.new(json)}
		end

		def exercises
			Topic.get_exercises(slug)
		end

		private

			def self.values(hsh, key)
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

	class Video < Khanable

		@@attributes = [:date_added, :description, :download_urls, :duration, :extra_properties, :ka_url, :keywords, :kind, :readable_id, :relative_url, :title, :url, :views, :youtube_id]
		@@attributes.each {|attr| attr_accessor attr}

		# a = KhanAcademy::Video.retrieve("circulatory-system-and-the-heart")
		def self.retrieve(video)
			options = self.get_data("/videos/#{video}")
			return new(options)
		end

		def self.get_exercises(video)
			options = self.get_data("/videos/#{video}/exercises")
			options.collect {|json| Exercise.new(json)}
		end

		def exercises
			Video.get_exercises(readable_id)
		end

	end

	class Exercise < Khanable

		@@attributes = [:date_added, :description, :download_urls, :duration, :extra_properties, :ka_url, :keywords, :kind, :readable_id, :relative_url, :title, :url, :views, :youtube_id]
		@@attributes.each {|attr| attr_accessor attr}

		def self.retrieve(exercise)
			options = self.get_data("/exercises/#{exercise}")
			return new(options)
		end

		# a = KhanAcademy::Exercise.all
		def self.all
			options = self.get_data("/exercises")
			options.collect {|json| Exercise.new(json)}
		end

		def self.autocomplete
			# "A listing of Perseus exercises used for autocomplete.""
			options = self.get_data("/exercises/perseus_autocomplete")
			# Returns actual JSON as I do not know what this does...
		end

		# --- API never passes readable_id necessary yet ---
		# They are switching to perseus exercise framework, stuff is changing

		#def videos
			#options = self.get_data("/exercises/#{name}/videos")
			#options.collect {|json| Video.new(json)}
		#end

		#def followups
			#options = self.get_data("/exercises/#{name}/followup_exercises")
			#options.collect {|json| Exercise.new(json)}
		#end

	end

end
