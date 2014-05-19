module PrintIt
  VERSION = "0.0.1"
  module_function
  def slic3r_version
    ver = ''
    slicer = IO.popen(['slic3r', '--version'])
    slicer.each {|l| ver << l}
    Process.kill("TERM", slicer.pid)
    slicer.close
    ver
  end
end