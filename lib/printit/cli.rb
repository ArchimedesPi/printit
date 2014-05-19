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
      progress_bar.log "Using Slic3r #{PrintIt.slic3r_version}"
      # Do the stuff
      job.start({:progressbar => progress_bar})
    end
  end
end