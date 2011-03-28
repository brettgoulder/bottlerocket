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
  
  def find(db_type, name)
    attrs[db_type][name]
  end
  
  def method_missing(field, *args)
    begin
      if field.to_s == 'development' || field.to_s == 'production'
        @db_type = field.to_s
      else
        find(@db_type, field.to_s)
      end
    rescue
      super(field, *args)
    end
  end
  
end