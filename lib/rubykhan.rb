require 'httparty'
require 'json'

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


module KhanAcademy

	class Topic
		include HTTParty
		format :json
		
		attr_accessor :icon_src, :domain_slug, :relative_url, :web_url, :ka_url, :translated_standalone_title, :translated_title, :gplus_url, :id, :old_key_name, :hide, :title, :child_data, :children, :twitter_url, :translated_description, :deleted_mod_time, :logo_image_url, :in_knowledge_map, :description, :x_pos, :node_slug, :deleted, :facebook_url, :backup_timestamp, :render_type, :background_image_url, :background_image_caption, :assessment_progress_key, :topic_page_url, :extended_slug, :slug, :tags, :kind, :in_topic_browser, :sha, :standalone_title, :y_pos, :current_revision_key, :content_kind, :translated_short_display_name, :assessment_items, :relative_url, :file_name, :author_name, :creation_date, :uses_assessment_items, :all_assessment_item_keys, :ka_url, :v_position, :translated_title, :translated_description_html, :display_name, :tracking_document_url, :tags, :summative, :live, :pretty_display_name, :translated_pretty_display_name, :problem_types, :curated_related_videos, :covers, :h_position, :translated_display_name, :sha1, :name, :prerequisites, :assessment_item_tags, :seconds_per_fast_problem, :short_display_name, :tutorial_only, :current_revision_key, :image_url_256, :content_ki, :translated_youtube_id, :has_questions, :keywords, :duration, :id, :description_html, :title, :progress_key, :edit_slug, :author_names, :deleted_mod_time, :description, :extra_properties, :node_slug, :deleted, :backup_timestamp, :date_added, :download_urls, :translated_youtube_lang, :kind, :url, :ka_user_license, :global_id, :sha, :translated_description, :image_url, :youtube_id, :position, :content_kind, :readable_id

		def initialize(options)

			self.icon_src = options['icon_src']
			self.domain_slug = options['domain_slug']
			self.relative_url = options['relative_url']
			self.web_url = options['web_url']
			self.ka_url = options['ka_url']
			self.translated_standalone_title = options['translated_standalone_title']
			self.translated_title = options['translated_title']
			self.gplus_url = options['gplus_url']
			self.id = options['id']
			self.old_key_name = options['old_key_name']
			self.hide = options['hide']
			self.title = options['title']
			self.child_data = options['child_data']
			self.children = options['children']
			self.twitter_url = options['twitter_url']
			self.translated_description = options['translated_description']
			self.deleted_mod_time = options['deleted_mod_time']
			self.logo_image_url = options['logo_image_url']
			self.in_knowledge_map = options['in_knowledge_map']
			self.description = options['description']
			self.x_pos = options['x_pos']
			self.node_slug = options['node_slug']
			self.deleted = options['deleted']
			self.facebook_url = options['facebook_url']
			self.backup_timestamp = options['backup_timestamp']
			self.render_type = options['render_type']
			self.background_image_url = options['background_image_url']
			self.background_image_caption = options['background_image_caption']
			self.assessment_progress_key = options['assessment_progress_key']
			self.topic_page_url = options['topic_page_url']
			self.extended_slug = options['extended_slug']
			self.slug = options['slug']
			self.tags = options['tags']
			self.kind = options['kind']
			self.in_topic_browser = options['in_topic_browser']
			self.sha = options['sha']
			self.standalone_title = options['standalone_title']
			self.y_pos = options['y_pos']
			self.current_revision_key = options['current_revision_key']
			self.content_kind = options['content_kind']
			self.translated_short_display_name = options['translated_short_display_name']
			self.assessment_items = options['assessment_items']
			self.relative_url = options['relative_url']
			self.file_name = options['file_name']
			self.author_name = options['author_name']
			self.creation_date = options['creation_date']
			self.uses_assessment_items = options['uses_assessment_items']
			self.all_assessment_item_keys = options['all_assessment_item_keys']
			self.ka_url = options['ka_url']
			self.v_position = options['v_position']
			self.translated_title = options['translated_title']
			self.translated_description_html = options['translated_description_html']
			self.display_name = options['display_name']
			self.tracking_document_url = options['tracking_document_url']
			self.tags = options['tags']
			self.summative = options['summative']
			self.live = options['live']
			self.pretty_display_name = options['pretty_display_name']
			self.translated_pretty_display_name = options['translated_pretty_display_name']
			self.problem_types = options['problem_types']
			self.curated_related_videos = options['curated_related_videos']
			self.covers = options['covers']
			self.h_position = options['h_position']
			self.translated_display_name = options['translated_display_name']
			self.sha1 = options['sha1']
			self.name = options['name']
			self.prerequisites = options['prerequisites']
			self.assessment_item_tags = options['assessment_item_tags']
			self.seconds_per_fast_problem = options['seconds_per_fast_problem']
			self.short_display_name = options['short_display_name']
			self.tutorial_only = options['tutorial_only']
			self.current_revision_key = options['current_revision_key']
			self.image_url_256 = options['image_url_256']
			self.content_ki = options['content_ki']
			self.translated_youtube_id = options['translated_youtube_id']
			self.has_questions = options['has_questions']
			self.keywords = options['keywords']
			self.duration = options['duration']
			self.id = options['id']
			self.description_html = options['description_html']
			self.title = options['title']
			self.progress_key = options['progress_key']
			self.edit_slug = options['edit_slug']
			self.author_names = options['author_names']
			self.deleted_mod_time = options['deleted_mod_time']
			self.description = options['description']
			self.extra_properties = options['extra_properties']
			self.node_slug = options['node_slug']
			self.deleted = options['deleted']
			self.backup_timestamp = options['backup_timestamp']
			self.date_added = options['date_added']
			self.download_urls = options['download_urls']
			self.translated_youtube_lang = options['translated_youtube_lang']
			self.kind = options['kind']
			self.url = options['url']
			self.ka_user_license = options['ka_user_license']
			self.global_id = options['global_id']
			self.sha = options['sha']
			self.translated_description = options['translated_description']
			self.image_url = options['image_url']
			self.youtube_id = options['youtube_id']
			self.position = options['position']
			self.content_kind = options['content_kind']
			self.readable_id = options['readable_id']
		end

		def self.get_info(topic)
			uri = "http://www.KhanAcademy.org/api/v1/topics/#{topic}"
			options = KhanAcademy::Topic.get(uri)
			new(options)
		end

		def self.all(key = "extended_slug")
			uri = "http://www.khanacademy.org/api/v1/topictree"
			options = KhanAcademy::Topic.get(uri).to_hash
			values(options, key)
		end

		def self.tree
			uri = "http://www.khanacademy.org/api/v1/topictree"
			topictree = KhanAcademy::Topic.get(uri)
		end

		def self.get_videos(topic)
			uri = "http://www.KhanAcademy.org/api/v1/topics/#{topic}/videos"
			options = KhanAcademy::Topic.get(uri)
			options.collect {|json| new(json)}
		end

		def self.get_exercises(topic)
			uri = "http://www.KhanAcademy.org/api/v1/playlists/#{topic}/exercises"
			options = KhanAcademy::Topic.get(uri)
			options.collect {|json| new(json)}
		end

	end

end
