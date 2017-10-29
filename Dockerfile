FROM ubuntu:15.04

MAINTAINER yuyakaido

# Install basic environment
RUN \
  apt-get update -y && \
  apt-get install -y curl && \
  apt-get install -y unzip && \
  apt-get install -y git

# Install Java
RUN \
  apt-get install -y openjdk-8-jdk

# Install Android SDK
RUN \
  mkdir /usr/local/sdk-tools-linux && \
  cd $_ && \
  curl -L -O https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip && \
  unzip sdk-tools-linux-3859397.zip && \
  rm sdk-tools-linux-3859397.zip && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "tools" && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "platform-tools" && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "build-tools;25.0.3" && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "platforms;android-25" && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "extras;android;m2repository" && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "extras;google;m2repository" && \
  echo y | /usr/local/sdk-tools-linux/tools/bin/sdkmanager "extras;google;google_play_services"

# Setup environment variables
ENV JAVA8_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_HOME $JAVA8_HOME
ENV ANDROID_HOME /usr/local/sdk-tools-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
