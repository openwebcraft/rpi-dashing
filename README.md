# rpi-docker-dashing

Raspberry Pi compatible Docker Image with a minimal [Dashing](http://dashing.io/) sample dashboard. 

## Building the docker image

    $ docker build -t matthiasg/rpi-dashing .
		
## Start the container

    $ docker run -i -d -p 3030:3030 matthiasg/rpi-dashing

## Use your own dashport project

    $ docker run -i -d -p 3030:3030 -v `pwd`/dashboard:/usr/src/app:rw matthiasg/rpi-dashing
    
## Start the container and keep control, e.g. when using the docker image for development

    $ docker run -i -t -p 3030:3030 -v `pwd`/dashboard:/usr/src/app:rw matthiasg/rpi-dashing bash
    
    $ dashing new dashboard