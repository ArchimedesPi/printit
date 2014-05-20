require 'multi_json'
require 'printit/printer'
require 'printit/part'
require 'printit/interface'
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
      threads = []
      printers.each do |printer|
        threads << Thread.new(printer) do |printer|
          until @print_queue.empty? do
            part = @print_queue.pop
            puts "Working on #{part.name} on printer #{printer.name}"
            puts "Slicing #{part.name} from file #{part.file} to #{part.slicedfile}"
            part.slice
            puts "Sliced #{part.name} from file #{part.file} to #{part.slicedfile}"
            puts "Printing #{part.name} from GCode #{part.slicedfile} on #{printer.name} through #{printer.port} on the #{printer.extruder} extruder"
          end
        end
      end
      threads.each do |thread|
        thread.join
      end
    end
    def stop(options={:hard=>false})
    end
  end
end