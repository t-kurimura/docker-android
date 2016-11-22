FROM ubuntu:15.04

MAINTAINER yuyakaido

# Install basic environment
RUN \
  apt-get update -y && \
  apt-get install -y curl && \
  apt-get install -y git

# Install Java
RUN \
  apt-get install -y openjdk-8-jdk

# Install Android SDK
RUN \
  cd /usr/local/ && \
  curl -L -O http://dl.google.com/android/android-sdk_r24.4.1-linux.tgz && \
  tar xf android-sdk_r24.4.1-linux.tgz && \
  rm android-sdk_r24.4.1-linux.tgz && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter tools && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter platform-tools && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter build-tools-25.0.0 && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter android-24 && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter android-25 && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter extra-android-m2repository && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter extra-google-m2repository && \
  echo y | /usr/local/android-sdk-linux/tools/android update sdk --no-ui --all --filter extra-google-google_play_services

# Setup environment variables
ENV JAVA8_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV JAVA_HOME $JAVA8_HOME
ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
