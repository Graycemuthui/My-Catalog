class Source
    attr_reader :id
    attr_accessor :name, :item
    def initialize(name)
        @id = Random.rand(1...1000)
        @name = name
        @items = []
    end
end 
