require 'multi_json'

module PrintIt
  class Job
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
  end
end