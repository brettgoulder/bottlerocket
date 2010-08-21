class Entity < SimpleStruct
  def update
    content_type.update(self.attributes)
  end
  
  def delete
    content_type.delete(self.attributes)
  end
end
