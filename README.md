[![Code Climate](https://codeclimate.com/github/ArchimedesPi/printit.png)](https://codeclimate.com/github/ArchimedesPi/printit) [![Dependency Status](https://gemnasium.com/ArchimedesPi/printit.svg)](https://gemnasium.com/ArchimedesPi/printit)

S67 batch print job system
==========================

## Installation

### Dependencies:

- [our fork of Printrun](https://github.com/ArchimedesPi/Printrun) in search path
- Skeinforge in search path

### Gem
`gem install printit` (Ahhh, ruby ;)


## How to use

Create a directory for your project.
In that directory, create a file `job.json`, and a directory `stls`.
Move all your STLs into the `stls` directory.
The directory tree should be similar to this example:
````
        - ~/Models/
            |_ ArchimedesPi/
                |_ wow-example/
                   |_ job.json
                   |_ stls/
                     |_ mypart1.stl
                     |_ jimspart2.stl
                     |_ standoff.stl
````

Then you must populate `job.json` with metadata about the print job, as in this example:
````json
{
  "name": "wow"
  "description": "best example ever",
  "slicer": "skeinforge",
  "printers": [
    { "name": "Rep2", "port": "/dev/ttyUSB0", "extruder": "right" }
    { "name": "FlashForge1", "port": "/dev/ttyUSB1", "extruder": "left" }
  ],
  "parts": [
    { "name": "My part 1", "file": "mypart1.stl", "multiplier": 3, "tile": true }
    { "name": "Jim's part 2", "file": "jimspart2.stl" }
    { "name": "Standoff", "file": "standoff", "multiplier": 2, "tile": false}
  ]
}
````

