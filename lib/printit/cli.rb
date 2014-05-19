require 'thor'
require 'printit/job'

module PrintIt
  class CLI < Thor
    desc "now", "run the job in job.json"
    def now
      job = PrintIt::Job.new('./job.json')
      puts 'Loaded job.json'
      puts "Using Slic3r #{PrintIt.slic3r_version}"
      # Do the stuff
      job.start
    end
  end
end