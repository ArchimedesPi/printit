require 'thor'

module PrintIt
  class CLI < Thor
    desc "run", "run the job in job.json"
    def run
      #job = Job.new('./job.json')
    end
  end
end