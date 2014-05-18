require 'multi_json'
require 'printit/part'
require 'printit/printer'

module PrintIt
  class Job
    attr_reader :name, :description, :slicer, :printers
    attr_accessor :parts
    def initialize(file)
      data = MultiJson.load(File.read(file), :symbolize_keys => true)
      @name = data[:name]
      @description = data[:description]
      @slicer = data[:slicer]
      @printers ||= []
      data[:printers].each do |printer|
        @printers << PrintIt::Printer.new(printer)
      end
      
      @parts ||= []
      
      data[:parts].each do |part|
        @parts << PrintIt::Part.new(part)
      end
    end
    
    def start(options)
    end
    def stop(hard)
    end
  end
end