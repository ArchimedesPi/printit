module PrintIt
  class Printer
    attr_reader :name, :port, :extruder
    
    def initialize(spec)
      @name = spec[:name]
      @port = spec[:port]
      @extruder = spec[:extruder]
    end
  end
end