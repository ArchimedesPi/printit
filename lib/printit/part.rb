module PrintIt
  class Part
    attr_reader :name, :file, :multiplier, :tile
    def initialize(spec)
      @name = spec[:name]
      @file = spec[:file]
      @multiplier = spec[:multiplier] || 1
      @tile = spec[:tile] || false
    end
  end
end