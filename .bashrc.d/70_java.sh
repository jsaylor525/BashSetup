#!/bin/bash

if [ ! -z "${JAVA_DEV}" ]; then
  # Choose the version of java to use.
  export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
  export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
  export PATH="${PATH}:${JAVA_HOME}/bin"

  alias intellij="intellij-idea-community &> /dev/null &"

  [ ! -z "$DISPLAY" ] && log_success "JAVA environment set"
fi
