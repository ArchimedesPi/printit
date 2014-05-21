require 'colorize'

module PrintIt
  class Part
    attr_reader :name, :file, :multiplier, :tile, :slicedfile
    attr_accessor :columns, :rows, :extruder
    def initialize(spec)
      @name = spec[:name]
      @file = "./stls/#{spec[:file]}"
      @multiplier = spec[:multiplier] || 1
      @tile = spec[:tile] || false
      @slicedfile = "./gcode/#{File.basename(@file, '.*')}.gcode"
    end
    
    def slice(config={})
      slicer = IO.popen("slic3r --output #{@slicedfile} #{@file}")
      slicer.each {|l| print "#{@name}".colorize(:light_white), "::#{l}".colorize(:light_blue)}
      Process.kill("TERM", slicer.pid)
      slicer.close
      # done
    end
  end
end