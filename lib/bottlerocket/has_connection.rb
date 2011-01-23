module HasConnection
  def db
    @db = Mongo::Connection.new(Configuration.instance.database_host,
                                Configuration.instance.database_port).db(Configuration.instance.database_name)
  end
end