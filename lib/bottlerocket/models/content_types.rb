class ContentTypes
  attr_accessor :content_types
  
  def self.load(content_types_yaml)
    ContentTypes.new content_types_yaml
  end
  
  def initialize(content_types_yaml)
    self.content_types = YAML.load_file(content_types_yaml).collect { |attrs| ContentType.new(attrs) }
  end
  
  def all
    content_types
  end
  
  def length
    content_types.length
  end
  
  def find(name)
    content_types.detect { |ct| ct.name == name }
  end
  
  def method_missing(field, *args)
    begin
      if find field.to_s.ends_with?('=')
        field.to_s = args.first
      else
        find field.to_s
      end
    rescue
      raise MethodNotFound
    end
  end
end