module PrintIt
  class Printer
    def initialize(spec)
      @name = spec[:name]
      @port = spec[:port]
      @extruder = spec[:extruder]
    end
  end
end