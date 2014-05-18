require 'multi_json'

module PrintIt
  class Job
    attr_reader :name, :description, :slicer, :printers
    attr_accessor :parts
    def initialize(file)
      data = MultiJson.load(File.read(file), :symbolize_keys => true)
      @name = data[:name]
      @description = data[:description]
      @slicer = data[:slicer]
      data[:printers].each do |printer|
        @printers << Printer.new(printer)
      end
      
      data[:parts].each do |part|
        @parts << Part.new(part)
      end
    end
    
    def start(options)
    end
    def stop(hard)
    end
  end
end