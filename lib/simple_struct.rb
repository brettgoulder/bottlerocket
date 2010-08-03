class SimpleStruct
  attr_accessor :attributes
  
  def initialize(attributes)
    self.attributes = attributes
  end
  
  def attributes=(attrs)
    @attributes = HashWithIndifferentAccess.new attrs
  end
  
  def method_missing(field, *args)
    begin
      if field.to_s.ends_with?('=')
        @attributes[field] = args.first
      else
        @attributes[field]
      end
    rescue
      super(field, *args)
    end
  end
end