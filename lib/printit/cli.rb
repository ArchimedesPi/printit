require 'thor'
require 'ruby-progressbar'

module PrintIt
  class CLI < Thor
    desc "run", "run the job in job.json"
    def run
      progress-bar = ProgressBar.create(:title => 'Loading', :total => nil)
      job = Job.new('./job.json')
      progress-bar.log 'Loaded job.json'
      # Do the stuff
    end
  end
end