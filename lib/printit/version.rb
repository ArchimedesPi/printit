module PrintIt
  VERSION = "0.0.1"
  module_function
  def slic3r_version
    lines = []
    IO.popen(['slic3r', '--version']).each {|l| lines << l }
    lines.join
  end
end