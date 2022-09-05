class Genre < Item
  attr_reader :id
  attr_accessor :names, :items

  def initialize(names)
    @id = rand(1..1000)
    @names = names
    @items = []
  end
end
