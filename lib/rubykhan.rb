
require 'pry'
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
		attr_reader :icon_src, :domain_slug, :relative_url, :web_url, :ka_url, :translated_standalone_title, :translated_title, :gplus_url, :id, :old_key_name, :hide, :title, :child_data, :children, :twitter_url, :translated_description, :deleted_mod_time, :logo_image_url, :in_knowledge_map, :description, :x_pos, :node_slug, :deleted, :facebook_url, :backup_timestamp, :render_type, :background_image_url, :background_image_caption, :assessment_progress_key, :topic_page_url, :extended_slug, :slug, :tags, :kind, :in_topic_browser, :sha, :standalone_title, :y_pos, :current_revision_key, :content_kind
		
		def initialize(options)
			options.each do |key, value| 
		    unless key.to_s.empty?
				  eval("@#{key}=#{value.inspect}")
				end
		  end
		end

		def self.get_info(topic)
			uri = "http://www.KhanAcademy.org/api/v1/topic/#{topic}"
			options = HTTParty.get(uri)
			new(options)
		end

		def self.all
			uri = "http://www.khanacademy.org/api/v1/topictree"
			options = HTTParty.get(uri).to_hash
			values(options, 'slug')
		end

	end

end

