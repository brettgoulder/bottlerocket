require 'singleton'

class ConnectionHelper
  attr_accessor :attrs
  
  def initialize(attrs)
    self.attrs = attrs
  end
  
  def method_missing(field, *args)
    begin
      attrs[field.to_s]
    rescue
      super(field, *args)
    end
  end
  
  def connection
    # TODO Brett to return a mongo connection.
  end
end

class Configuration
  include Singleton
  
  attr_accessor :config_file_location
  
  def attrs
    @attrs ||= YAML.load_file config_file_location
  end
  
  def environments
    %w(development test staging production)
  end
  
  def content_types
    @content_types ||= ContentTypes.load(content_types_file)
  end
  
  def method_missing(field, *args)
    begin
      if environments.include? field.to_s
        ConnectionHelper.new attrs[field.to_s]
      else
        attrs[field.to_s]
      end
    rescue
      super(field, *args)
    end
  end
  
end