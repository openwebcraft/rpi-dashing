FROM hypriot/rpi-ruby
FROM hypriot/rpi-node
FROM hypriot/rpi-python

MAINTAINER Matthias Geisler "matthias@openwebcraft.com"

# Install prerequisites
RUN apt-get update; apt-get -y upgrade
RUN apt-get install -y build-essential ruby-dev

# Install Dashing and Bundler
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install dashing
RUN gem install bundle

# Install Dashing project
RUN mkdir -p /usr/src/app
COPY ./dashboard/ /usr/src/app
WORKDIR /usr/src/app
RUN bundle

# Default command to start the Dashing project
CMD ["dashing", "start"]