require "fileutils"
require "yaml"
#require_relative "FSWatcher/filesystemwatcher"
require_relative "fswatcher"

class RubyDrop
	
	def initialize()
		# Load the config
		@@config = YAML.load_file("config.yml")
		
		# Prepare the document root
		@@config['rubydrop_root'] = @@config['rubydrop_root'] || "~/RubyDrop"
		@@config['rubydrop_root'] = File.expand_path(@@config['rubydrop_root'])
		
		# Create the filesystem watcher
		@watcher = FSWatcher.new()
	end
	
	public
	
	def self.config
		return @@config
	end
	
	def run()
		@watcher.start()
	end
end