#!/usr/bin/env bash

# Bash PHP Unit Task Runner
#
# Exit 0 if no errors found
# Exit 1 if errors were found
#
# Requires
# - php
#
# Arguments
# - None
SUBDIR="$1"
cd "$SUBDIR" || exit
./vendor/bin/pint

