class Entity < SimpleStruct
  def update
    content_type.update(self.attributes)
  end
end
