#!/usr/bin/env bash

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")
