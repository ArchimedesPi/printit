require 'thor'
require 'ruby-progressbar'
require 'printit/job'

module PrintIt
  class CLI < Thor
    desc "now", "run the job in job.json"
    def now
      progress_bar = ProgressBar.create(:title => 'Loading', :total => nil)
      job = PrintIt::Job.new('./job.json')
      progress_bar.log 'Loaded job.json'
      # Do the stuff
    end
  end
end