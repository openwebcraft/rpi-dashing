FROM hypriot/rpi-ruby:2.2.2
FROM hypriot/rpi-python

#FROM debian:jessie
#RUN apt-get install -y ruby python
#RUN gem install bundler

MAINTAINER Matthias Geisler "matthias@openwebcraft.com"

# Install prerequisites
RUN apt-get update; apt-get -y upgrade
RUN apt-get install -y build-essential curl

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

# Install Dashing
RUN gem install dashing

# Install Dashing project
RUN mkdir -p /usr/src/app
COPY ./dashboard/ /usr/src/app
WORKDIR /usr/src/app
RUN bundle

# Default command to start the Dashing project
CMD ["dashing", "start"]