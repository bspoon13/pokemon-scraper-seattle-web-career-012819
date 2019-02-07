class Pokemon

  attr_accessor :id, :name, :type, :db

  #is initialized with keyword arguments of id, name, type and db

  def initialize(id:, name:, type:, db:)
     @id = id
     @name = name
     @type = type
     @db = db
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    poke = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)
    poke2 = poke[0]
    pika = Pokemon.new(id: poke2[0], name: poke2[1], type: poke2[2], db: database_connection)
    #binding.pry
  end

  #let(:pokemon) {Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)}

end
