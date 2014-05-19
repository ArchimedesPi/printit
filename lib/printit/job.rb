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
      printers.each do |printer|
        p printer
        Thread.new(printer) do |printer|
          until @print_queue.empty do
            part = @print_queue.pop
            puts "Working on #{part.name} on #{printer.name}"
            puts "Slicing #{part.file} to #{part.slicedfile}"
            part.slice
            puts "Sliced #{part.name}."
            puts "Printing #{part.name} on #{printer.name}"
            printer.print(part)
            puts "Printed #{part.name}"
            puts "Waiting for removal from print bed on #{printer.name}"
            PrintIt::Interface.confirm("Remove the part #{part.name} from the printbed of #{printer.name}")
          end
        end
      end
      puts "Started threads"
    end
    def stop(options={:hard=>false})
    end
  end
end