FROM hypriot/rpi-ruby:2.2.2

#FROM ruby
#FROM python

MAINTAINER Matthias Geisler "matthias@openwebcraft.com"

# Install dependencies

# System packages
RUN apt-get update; apt-get -y upgrade
RUN apt-get install -y build-essential curl python

# Manual installs, e.g. Node.js
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

# Install Dashing project
RUN mkdir -p /usr/src/app
COPY ./dashboard/ /usr/src/app
WORKDIR /usr/src/app
RUN bundle install

# Default command to start the Dashing project
CMD ["dashing", "start"]