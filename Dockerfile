FROM ubuntu:bionic

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install x11vnc.
RUN apt-get install -y x11vnc

# Install xvfb.
RUN apt-get install -y xvfb

# Install fluxbox.
RUN apt-get install -y fluxbox

# Install wget.
RUN apt-get install -y wget

# Install wmctrl.
RUN apt-get install -y wmctrl

# Install libcurl3
RUN apt-get install -y libcurl3

# Install dos2unix
RUN apt-get install -y dos2unix

ARG PACKAGE_NAME

COPY ${PACKAGE_NAME} /
RUN apt-get -y install ./${PACKAGE_NAME}

COPY bootstrap.sh /
RUN chmod a+x ./bootstrap.sh
RUN dos2unix ./bootstrap.sh

CMD '/bootstrap.sh'
