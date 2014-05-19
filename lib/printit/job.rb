require 'multi_json'
require 'printit/printer'
require 'printit/part'
require 'thread'

module PrintIt
  class Job
    attr_reader :name, :description, :slicer, :printers
    attr_accessor :parts, :print_queue
    def initialize(file)
      @print_queue = Queue.new
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
        @print_queue << PrintIt::Part.new(part)
      end        
    end
    
    def start(options={})
      printers.each do |printer|
        p printer
        Thread.new do
        end
      end
      puts "Started threads"
    end
    def stop(options={:hard=>false})
    end
  end
end