[![Code Climate](https://codeclimate.com/github/ArchimedesPi/printit.png)](https://codeclimate.com/github/ArchimedesPi/printit) [![Dependency Status](https://gemnasium.com/ArchimedesPi/printit.svg)](https://gemnasium.com/ArchimedesPi/printit)

S67 batch print job system
==========================

## Installation
`gem install printit` (Ahhh, ruby ;)

## How to use

Create a directory for your project.
In that directory, create a file `bom.json`, and a directory `stls`.
Move all your STLs into the `stls` directory.
The directory tree should be similar to this example:
````
        - ~/Models/
            |_ ArchimedesPi/
                |_ wow-example/
                   |_ bom.json
                   |_ stls/
                     |_ mypart1.stl
                     |_ joespart2.stl
                     |_ standoff.stl
````

Then you must populate `bom.json` with metadata about the print job, as in this example:



