FROM ubuntu:16.04
MAINTAINER Cody Hiar <codyfh@gmail.com>

# Set a term for terminal inside the container, can't clear without it
ENV TERM screen-256color
ENV DEBIAN_FRONTEND noninteractive


# Update and install
RUN apt-get update && apt-get install -y \
      wget \
      curl \
      git \
      locales

# Generally a good idea to have these, extensions sometimes need them
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# The code should be symlinked to this directory
WORKDIR /app

# Install Elixir
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb &&  dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y esl-erlang elixir

# Install Phoenix archive
RUN mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez --force

EXPOSE 4000

# Install for asset management
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install nodejs -y

# Create the entry script
ADD entry.sh /opt/
RUN chmod 755 /opt/entry.sh
