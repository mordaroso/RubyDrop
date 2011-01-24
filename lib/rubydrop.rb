require "fileutils"
require "yaml"
require File.expand_path('fswatcher', File.dirname(__FILE__))
require File.expand_path('tcp_listen', File.dirname(__FILE__))

class RubyDrop
  
  def initialize()
    # Load the config
    @@config = YAML.load_file("config.yml")
    
    # Prepare the document root
    @@config['rubydrop_root'] = @@config['rubydrop_root'] || "~/RubyDrop"
    @@config['rubydrop_root'] = File.expand_path(@@config['rubydrop_root'])
    
    if @@config['git_debug'] then
      Grit.debug = true
    end
    
    # Create the filesystem watcher
    @watcher = FSWatcher.new()
    
    # and the TCP server
    TcpListen.new().start()
  end
  
  public
  
  def self.config
    return @@config
  end
  
  def run
    @watcher.start()
  end
end