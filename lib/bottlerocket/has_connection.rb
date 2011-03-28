module HasConnection
  def db
    @db = Mongo::Connection.new(Configuration.instance.development.database_host,
                                Configuration.instance.development.database_port).db(Configuration.instance.development.database_name)
  end
end