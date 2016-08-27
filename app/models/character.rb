class Character
  attr_reader :name, :house, :city, :id
  def initialize(input)
    @id = input["id"]
    @name = input["name"]
    @house = input["house"]
    @city = input["city"]
  end

  def self.all
    @characters = []
    @index = Unirest.get('http://localhost:3000/api/v1/characters').body
    @index.each do |character|
      cha = Character.new(character)
      @characters << cha
    end
    return @characters
  end

  def self.find_by(hash)
    @character = Unirest.get("http://localhost:3000/api/v1/characters/#{hash[:id]}.json").body
    Character.new(@character)
  end

  def self.create(input)
      @character = Unirest.post('http://localhost:3000/api/v1/characters',
      headers: {"Accept" => "application/json"},
      parameters: {name: input[:name],
                   city: input[:city],
                   house: input[:house]
                  }
      ).body
      Character.new(@character)
  end

  def update(hash)
      Unirest.patch("http://localhost:3000/api/v1/characters/#{hash[:id]}",
      headers: {"Accept" => "application/json"},
      parameters: {name: hash[:name],
                   city: hash[:city],
                   house: hash[:house]
                  }
      ).body
  end

  def destroy
     Unirest.delete("http://localhost:3000/api/v1/characters/#{id}",
      headers: {"Accept" => "application/json"}
      ).body
  end
end
