require 'singleton'
class Configuration
  include Singleton
  
  attr_accessor :config_file_location
  
  def attrs
    @attrs ||= YAML.load_file config_file_location
  end
  
  def content_types
    @content_types ||= ContentTypes.load(content_types_file)
  end
  
  def find(name)
    attrs[name]
  end
  
  def method_missing(field, *args)
    begin
      find field.to_s
    rescue
      super(field, *args)
    end
  end
end