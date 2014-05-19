module PrintIt
  class Printer
    attr_reader :name, :type, :port, :extruder, :priority
    attr_accessor :current_part, :running
    
    def initialize(spec)
      @name = spec[:name]
      @type = spec[:type]
      @port = spec[:port]
      @extruder = spec[:extruder]
      @priority = spec[:priority] || 0
      @running = spec[:running] || false
    end
    
    def print(part, spec={})
      # Grab the part gcode and print it
      printer = IO.popen("printcore.py #{port} #{part.slicedfile}")
      
    end
  end
end