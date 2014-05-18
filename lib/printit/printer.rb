module PrintIt
  class Printer
    attr_reader :name, :type, :port, :extruder, :priority
    attr_accessor :current_part, :running
    
    def initialize(spec)
      @name = spec[:name]
      @type = spec[:type]
      @port = spec[:port]
      @extruder = spec[:extruder]
      @priority = spec[:extruder] || 0
      @running = spec[:running] || false
    end
  end
end