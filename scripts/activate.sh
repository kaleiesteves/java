#!/bin/sh
# scripts/activate.sh
# Starts the environment for compiling and running Java projects.
# This script should be used like `source scripts/activate` from java/

# Set the name of the project directory
PROJECT="$PWD"

# Save original environment before changing
export OLD_PS1="$PS1"
export PS1="(Java) $PS1"

# Define function to build the project
build() {
    "$PROJECT/scripts/build.sh" "$@"
}

# Define function to deactivate project environment
deactivate() {
    export PS1="$OLD_PS1"
    unset OLD_PS1
    unset -f build
    unset -f deactivate
}