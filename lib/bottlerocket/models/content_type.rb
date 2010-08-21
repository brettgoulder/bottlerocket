require File.dirname(__FILE__) + '/../has_connection'

class ContentType < SimpleStruct
  include HasConnection
  
  def field_names
    fields.collect { |hash| hash.keys.first }
  end
  
  def title
    name.humanize
  end
  
  def single_title
    name.singularize.humanize
  end
  
  def collection
    db.collection name
  end
  
  def create(attrs)
    find_by_id collection.insert(attrs)
  end
   
  def update(attrs)
    a = attrs.dup
    a.delete :content_type
    collection.update({:_id => object_id(a[:_id])}, a)
  end
  
  def remove(attrs)
    collection.remove(attrs)
  end
  
  def find_by_id(id)
    find_one :_id => object_id(id)
  end
  
  def find_one(*args)
    result = collection.find_one(*args)
    result.merge!({:content_type => self}) if result.present?
    Entity.new result
  end
  
  def find(*args)
    collection.find(*args).collect { |attrs| Entity.new attrs.merge(:content_type => self) }
  end
  
  alias_method :all, :find
  
  def object_id(id)
    if id.is_a? String
      ObjectID.from_string(id)
    else
      id
    end
  end
  
end