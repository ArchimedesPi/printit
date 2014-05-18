module PrintIt
  class Part
    attr_reader :name, :file, :multiplier, :tile
    attr_accessor :columns, :rows, :extruder
    def initialize(spec)
      @name = spec[:name]
      @file = spec[:file]
      @multiplier = spec[:multiplier] || 1
      @tile = spec[:tile] || false
    end
    
    def slice(spec)
    end
    
    def print(printer, options={})
  end
end