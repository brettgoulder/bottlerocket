module HasConnection
  def db
    @db = Mongo::Connection.new.db(Configuration.instance.database_name)
  end
end