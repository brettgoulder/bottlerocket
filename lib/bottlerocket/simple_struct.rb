class SimpleStruct
  attr_accessor :attributes
  
  def initialize(attributes={})
    self.attributes = attributes
  end
  
  def attributes=(attrs)
    @attributes = HashWithIndifferentAccess.new attrs
  end
  
  def method_missing(field, *args)
    begin
      if field.to_s.end_with?('=')
        field_name = field.to_s.sub '=', ''
        @attributes[field_name] = args.first
      else
        @attributes[field]
      end
    rescue
      super(field, *args)
    end
  end
end