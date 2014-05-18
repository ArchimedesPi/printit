S67 batch print job system
==========================

## How to use

Create a directory with your github/twitter/etc username in `~/Models`/
Inside that directory, create a directory with the name of your project.
In that directory, create a file `bom.yml`, and a directory `stls`.
Move all your STLs into the `stls` directory.
The directory tree should be similar to this example:
        - ~/Models/
            |_ ArchimedesPi/
                |_ wow-example/
                   |_ bom.yml
                   |_ stls/
                     |_ mypart1.stl
                     |_ joespart2.stl
                     |_ standoff.stl

Then you must populate `bom.yml` with metadata about the print job, as in this example:
````yaml
name: wow
description: A great example project



