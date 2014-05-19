require 'pathname'

module PrintIt
  class Part
    attr_reader :name, :file, :multiplier, :tile, :slicedfile
    attr_accessor :columns, :rows, :extruder
    def initialize(spec)
      @name = spec[:name]
      @file = "./stls/#{spec[:file]}"
      @multiplier = spec[:multiplier] || 1
      @tile = spec[:tile] || false
      @silcedfile = "./gcode/#{Pathname.new(@file).basename}"
    end
    
    def slice(config=nil, outfile=nil)
      outfile ||= @outputfile
      IO.popen("slic3r --output #{outfile} #{file}")
      @outputfile = outfile
    end
  end
end