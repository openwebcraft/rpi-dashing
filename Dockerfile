FROM hypriot/rpi-ruby
#FROM debian:jessie

MAINTAINER Matthias Geisler "matthias@openwebcraft.com"

# Install prerequisites
RUN apt-get update; apt-get -y upgrade
RUN apt-get install -y build-essential ruby ruby-dev curl

# Install Node.js	
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

# Install Dashing and Bundler
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install dashing
RUN gem install bundle

# Install Dashing app project
RUN mkdir -p /usr/src/app
COPY ./dashboard/ /usr/src/app
WORKDIR /usr/src/app

# Default command that starts the Dashing project
CMD ["bash", "start.sh"]