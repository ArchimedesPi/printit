require 'pathname'

module PrintIt
  class Part
    attr_reader :name, :file, :multiplier, :tile
    attr_accessor :columns, :rows, :extruder
    def initialize(spec)
      @name = spec[:name]
      @file = "./stls/#{spec[:file]}"
      @multiplier = spec[:multiplier] || 1
      @tile = spec[:tile] || false
    end
    
    def slice(config=nil, outputfile=nil)
      outputfile ||= "./gcode/#{Pathname.new(@file).basename}"
      IO.popen("slic3r --output #{outputfile} #{file}")
    end

    def print(printer, options={})
    end
  end
end